import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'package:soopfood/widgets/shimmers/recipe_details_screen_shimmer.dart';
import 'dart:convert';
import '../models/recipe.dart';
import 'package:soopfood/provider/favorite_recipes_provider.dart';
import 'package:soopfood/widgets/category_indicator.dart';
import '../provider/recently_viewed_recipes_provider.dart';
import 'package:shared_preferences/shared_preferences.dart'; // Import SharedPreferences

class RecipeDetailsScreen extends StatelessWidget {
  final dynamic recipe;
  final bool isFromCuisine;

  const RecipeDetailsScreen(
      {super.key, required this.recipe, this.isFromCuisine = false});

  Future<Recipe?> _fetchFullRecipe(String mealId) async {
    // Check if recipe is cached
    final prefs = await SharedPreferences.getInstance();
    final cachedRecipeJson = prefs.getString('recipe_$mealId');
    if (cachedRecipeJson != null) {
      return Recipe.fromJson(json.decode(cachedRecipeJson));
    }

    // Fetch from API if not cached
    final response = await http.get(Uri.parse(
        'https://www.themealdb.com/api/json/v1/1/lookup.php?i=$mealId'));
    if (response.statusCode == 200) {
      final decodedData = json.decode(response.body);
      if (decodedData['meals'] != null && decodedData['meals'].isNotEmpty) {
        final newRecipe = Recipe.fromJson(decodedData['meals'][0]);
        // Cache the recipe
        await prefs.setString(
            'recipe_$mealId', json.encode(newRecipe.toJson()));
        return newRecipe;
      }
    }
    return null;
  }

  String getAuthor(Recipe recipe) {
    if (recipe.strSource != null && recipe.strSource!.isNotEmpty) {
      Uri uri = Uri.parse(recipe.strSource!);
      return uri.host;
    }
    return 'Unknown';
  }

  String getCuisine(Recipe recipe) {
    return recipe.strArea?.isNotEmpty == true ? recipe.strArea! : 'Unknown';
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Recipe?>(
      future: isFromCuisine
          ? _fetchFullRecipe(recipe.idMeal)
          : Future.value(recipe is Recipe ? recipe : Recipe.fromJson(recipe)),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return RecipeDetailsScreenShimmer();
        } else if (snapshot.hasError || snapshot.data == null) {
          return Scaffold(
              body: Center(
                  child: Text('Failed to load recipe details',
                      style: TextStyle(fontSize: 18))));
        }

        final Recipe fullRecipe = snapshot.data!;

        WidgetsBinding.instance.addPostFrameCallback((_) {
          Provider.of<RecentlyViewedRecipesProvider>(context, listen: false)
              .addRecentlyViewed(fullRecipe);
        });

        return Scaffold(
          appBar: AppBar(
            title: Text(
              'Recipe Details',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            ),
            flexibleSpace: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.pinkAccent, Colors.deepOrange],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
            ),
            elevation: 4,
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    ClipRRect(
                      borderRadius:
                          BorderRadius.vertical(bottom: Radius.circular(20)),
                      child: CachedNetworkImage(
                        imageUrl: fullRecipe.strMealThumb,
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height * 0.45,
                        placeholder: (context, url) => Container(
                          color: Colors.grey[300],
                          width: double.infinity,
                          height: MediaQuery.of(context).size.height * 0.45,
                          child: Center(child: CircularProgressIndicator()),
                        ),
                        errorWidget: (context, url, error) => Container(
                          color: Colors.grey,
                          child: Icon(Icons.image_not_supported),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 16,
                      right: 16,
                      child: Consumer<FavoriteRecipesProvider>(
                        builder: (context, favoriteProvider, child) {
                          return FutureBuilder<bool>(
                            future: favoriteProvider.isFavorite(fullRecipe),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return CircularProgressIndicator();
                              } else if (snapshot.hasError) {
                                return Icon(Icons.error);
                              } else {
                                final isFavorite = snapshot.data ?? false;
                                return FloatingActionButton(
                                  onPressed: () {
                                    favoriteProvider.toggleFavorite(fullRecipe);
                                  },
                                  backgroundColor:
                                      isFavorite ? Colors.red : Colors.white,
                                  elevation: 5,
                                  child: Icon(
                                    isFavorite
                                        ? Icons.favorite
                                        : Icons.favorite_border,
                                    color:
                                        isFavorite ? Colors.white : Colors.red,
                                  ),
                                );
                              }
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    fullRecipe.strMeal,
                    style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CategoryIndicator(
                          category: fullRecipe.strCategory ?? 'Unknown'),
                      Text(
                        getCuisine(fullRecipe),
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
                Divider(thickness: 1),
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    'Author: ${getAuthor(fullRecipe)}',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildDetailItem(
                          fullRecipe.strCategory ?? 'NA', Icons.category),
                      _buildDetailItem(
                          fullRecipe.strArea ?? 'NA', Icons.location_on),
                    ],
                  ),
                ),
                Divider(thickness: 1),
                _sectionTitle('Instructions'),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    fullRecipe.strInstructions ?? 'No instructions available.',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                Divider(thickness: 1),
                _sectionTitle('Ingredients'),
                _buildIngredientsList(fullRecipe.ingredients),
                Divider(thickness: 1),
                _sectionTitle('Steps'),
                _buildStepsList(fullRecipe.strInstructions),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _sectionTitle(String title) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Text(
        title,
        style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildDetailItem(String text, IconData icon) {
    return Column(
      children: [
        Icon(icon, size: 28, color: Colors.grey[700]),
        SizedBox(height: 4),
        Text(text, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
      ],
    );
  }

  Widget _buildIngredientsList(Map<String, String> ingredients) {
    return Column(
      children: ingredients.entries.map((entry) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(child: Text(entry.value)),
              Text(''), // You can add measurement or quantity here later
            ],
          ),
        );
      }).toList(),
    );
  }

  Widget _buildStepsList(String? instructions) {
    if (instructions == null || instructions.isEmpty) {
      return Padding(
          padding: EdgeInsets.all(16.0),
          child: Text('No instructions available.'));
    }
    List<String> steps = instructions.split('\r\n');
    return Column(
      children: steps
          .where((step) => step.isNotEmpty)
          .map((step) => ListTile(
                leading: Icon(Icons.circle, size: 12, color: Colors.green),
                title: Text(step),
              ))
          .toList(),
    );
  }
}
