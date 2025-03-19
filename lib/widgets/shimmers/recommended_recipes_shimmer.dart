// lib/widgets/shimmer/recommended_recipes_shimmer.dart
import 'package:flutter/material.dart';
import 'package:soopfood/widgets/shimmers/shimmer_loading.dart'; // Import generic ShimmerLoading

class RecommendedRecipesShimmer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
          child: ShimmerLoading(
            child: Container(
              width: 180, // Approximate width of the title
              height: 20, // Approximate height of the title
              color: Colors.grey[300],
            ),
          ),
        ),
        SizedBox(height: 6),
        SizedBox(
          height: 152, // Same height as the ListView
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 5, // Assuming 5 shimmer cards
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6.0),
                child: ShimmerLoading(
                  child: SizedBox(
                    width: 150, // Same width as RecipeCard
                    child: Card(
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          ClipRRect(
                            borderRadius:
                                BorderRadius.vertical(top: Radius.circular(10)),
                            child: Container(
                              height: 100, // Approximate image height
                              color: Colors.grey[300],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 16, // Approximate text height
                              color: Colors.grey[300],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
