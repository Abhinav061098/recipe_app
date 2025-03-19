import 'package:flutter/material.dart';
import 'package:soopfood/services/spoonfood_service.dart';
import 'package:soopfood/models/recipe.dart';
import '../screens/recipe_details_screen.dart';
import '../widgets/shimmers/random_meal_shimmer.dart'; // Import the shimmer widget

class RandomMealWidget extends StatefulWidget {
  @override
  _RandomMealWidgetState createState() => _RandomMealWidgetState();
}

class _RandomMealWidgetState extends State<RandomMealWidget> {
  late Future<List<Recipe>> _randomMealsFuture;

  @override
  void initState() {
    super.initState();
    _randomMealsFuture = fetchRandomMeals();
  }

  Future<List<Recipe>> fetchRandomMeals() async {
    try {
      final meals = await SpoonfoodService().getRandomMeals(10);
      return meals.map((meal) => Recipe.fromJson(meal)).toList();
    } catch (e) {
      print("Error fetching random meals: $e");
      return [];
    }
  }

  void navigateToRecipeDetail(Recipe meal) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => RecipeDetailsScreen(recipe: meal),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Conditionally display the "Explore Recipes 🍽️" text based on the loading state
        FutureBuilder<List<Recipe>>(
          future: _randomMealsFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return RandomMealShimmer(); // Show shimmer widget while loading
            }

            // Show the "Explore Recipes 🍽️" text only when loading is finished
            if (snapshot.connectionState != ConnectionState.waiting) {
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                child: Text(
                  "Explore Recipes 🍽️",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              );
            }
            return SizedBox(); // Empty sized box for shimmer state
          },
        ),
        SizedBox(height: 6),
        // FutureBuilder to display meals or handle error/loading state
        FutureBuilder<List<Recipe>>(
          future: _randomMealsFuture,
          builder: (context, snapshot) {
            // Show shimmer loading while waiting for data
            if (snapshot.connectionState == ConnectionState.waiting) {
              return RandomMealShimmer(); // Show shimmer widget
            }

            // Error handling if the data fails to load
            if (snapshot.hasError ||
                snapshot.data == null ||
                snapshot.data!.isEmpty) {
              return Center(child: Text("Failed to load meals. Try again!"));
            }

            // Data is available, build the meal list
            return SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: snapshot.data!.map((meal) {
                  return GestureDetector(
                    onTap: () => navigateToRecipeDetail(meal),
                    child: Container(
                      width: 120, // Reduced width
                      margin: EdgeInsets.all(6.0),
                      child: Card(
                        elevation: 3,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(10),
                              ),
                              child: Image.network(
                                meal.strMealThumb,
                                fit: BoxFit.cover,
                                width: double.infinity,
                                height: 100, // Reduced height
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(6.0),
                              child: Text(
                                meal.strMeal,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            );
          },
        ),
      ],
    );
  }
}
