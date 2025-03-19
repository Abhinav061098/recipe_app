// lib/screens/shimmer/filtered_recipes_screen_shimmer.dart
import 'package:flutter/material.dart';
import 'package:soopfood/widgets/shimmers/shimmer_loading.dart'; // Import generic ShimmerLoading

class FilteredRecipesScreenShimmer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 12.0,
          mainAxisSpacing: 12.0,
          childAspectRatio: 0.8,
        ),
        itemCount: 6, // Number of shimmer items (adjust as needed)
        physics: const NeverScrollableScrollPhysics(), // Disable scrolling
        itemBuilder: (context, index) {
          return ShimmerLoading(
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              elevation: 4,
              clipBehavior: Clip.antiAlias,
              child: Stack(
                children: [
                  Container(
                    color: Colors.grey[300], // Placeholder image
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: [
                            Colors.black.withOpacity(0.7),
                            Colors.transparent
                          ],
                        ),
                      ),
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 8),
                      child: Container(
                        width: double.infinity,
                        height: 16, // Approximate text height
                        color: Colors.grey[400], // Placeholder text
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
