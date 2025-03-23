import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:soopfood/provider/recipe_provider.dart';
import 'package:soopfood/screens/sub_screen/recipe_details_screen.dart';
import 'package:soopfood/shimmers/cuisine_recipes_screen_shimmer.dart';
import '../../models/recipe.dart';

class CuisineRecipesScreen extends StatelessWidget {
  final String cuisine;

  const CuisineRecipesScreen({super.key, required this.cuisine});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// 📌 Enhanced AppBar with gradient background
      appBar: AppBar(
        title: Text(
          '$cuisine Recipes',
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
        ),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.pinkAccent,
                Colors.deepOrange
              ], // Modern gradient effect
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        elevation: 6,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(15)),
        ),
      ),
      body: Consumer<RecipeProvider>(
        builder: (context, recipeProvider, child) {
          if (recipeProvider.isLoading) {
            return CuisineRecipesScreenShimmer();
          }

          final recipes = recipeProvider.recipes;

          if (recipes.isEmpty) {
            return Center(
              child: Text(
                'No recipes found for $cuisine.',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey.shade600,
                ),
              ),
            );
          }

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: ListView.builder(
              itemCount: recipes.length,
              physics: const BouncingScrollPhysics(), // Smooth scrolling effect
              itemBuilder: (context, index) {
                final recipe = recipes[index];

                return GestureDetector(
                  onTap: () async {
                    final mealId = recipe.idMeal;
                    final response = await http.get(Uri.parse(
                        'https://www.themealdb.com/api/json/v1/1/lookup.php?i=$mealId'));

                    if (response.statusCode == 200) {
                      final decodedData = json.decode(response.body);
                      if (decodedData['meals'] != null &&
                          decodedData['meals'].isNotEmpty) {
                        final fullRecipe =
                            Recipe.fromJson(decodedData['meals'][0]);
                        Navigator.push(
                          context,
                          PageRouteBuilder(
                            transitionDuration:
                                const Duration(milliseconds: 400),
                            pageBuilder: (_, __, ___) => RecipeDetailsScreen(
                                recipe: fullRecipe, isFromCuisine: true),
                            transitionsBuilder: (_, animation, __, child) {
                              return FadeTransition(
                                  opacity: animation, child: child);
                            },
                          ),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content: Text('Recipe details not found.')),
                        );
                      }
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content: Text('Failed to load recipe details.')),
                      );
                    }
                  },
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    elevation: 4,
                    margin: const EdgeInsets.only(bottom: 12),
                    color: Colors.white,
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: const BorderRadius.horizontal(
                            left: Radius.circular(15),
                          ),
                          child: Hero(
                            tag: recipe.idMeal,
                            child: Image.network(
                              recipe.strMealThumb,
                              width: 110,
                              height: 110,
                              fit: BoxFit.cover,
                              loadingBuilder: (context, child, progress) {
                                if (progress == null) return child;
                                return Container(
                                  width: 110,
                                  height: 110,
                                  color: Colors.grey.shade300,
                                  child: const Center(
                                    child: CircularProgressIndicator(
                                      strokeWidth: 2,
                                      color: Colors.orangeAccent,
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(14.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  recipe.strMeal,
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                const SizedBox(height: 6),
                                Text(
                                  "Tap to view details",
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey.shade600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(right: 10),
                          child: Icon(Icons.arrow_forward_ios,
                              color: Colors.grey, size: 18),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
