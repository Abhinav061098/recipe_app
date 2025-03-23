import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:soopfood/provider/recipe_provider.dart';
import '../../screens/sub_screen/cuisine_recipes_screen.dart';
import '../../provider/cuisine_list_provider.dart';
import '../../shimmers/cuisine_list_shimmer.dart'; // Import the shimmer widget

class CuisineList extends StatelessWidget {
  const CuisineList({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CuisineListProvider>(
      builder: (context, cuisineListProvider, child) {
        final cuisines = cuisineListProvider.getCuisines();

        // Show shimmer loading if cuisines list is empty (i.e., loading)
        if (cuisines.isEmpty) {
          return CuisineListShimmer(); // Use your custom shimmer effect here
        }

        return SizedBox(
          height: 50.0,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: cuisines.length,
            itemBuilder: (context, index) {
              final cuisine = cuisines[index];

              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6.0),
                child: GestureDetector(
                  onTap: () {
                    context
                        .read<RecipeProvider>()
                        .fetchRecipes('', cuisine, context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            CuisineRecipesScreen(cuisine: cuisine),
                      ),
                    );
                  },
                  child: Chip(
                    label: Text(
                      cuisine,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.black87, // Softer color for text
                      ),
                    ),
                    backgroundColor:
                        Colors.grey[200], // Light, minimal background
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    elevation: 2, // Slight elevation for subtle depth
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
