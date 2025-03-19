// lib/screens/shimmer/cuisine_recipes_screen_shimmer.dart
import 'package:flutter/material.dart';
import 'package:soopfood/widgets/shimmers/shimmer_loading.dart'; // Import generic ShimmerLoading

class CuisineRecipesScreenShimmer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ListView.builder(
        itemCount: 6, // Number of shimmer items (adjust as needed)
        physics: const NeverScrollableScrollPhysics(), // Disable scrolling
        itemBuilder: (context, index) {
          return ShimmerLoading(
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
                    child: Container(
                      width: 110,
                      height: 110,
                      color: Colors.grey.shade300, // Placeholder image
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(14.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 150, // Approximate text width
                            height: 20, // Approximate text height
                            color: Colors.grey.shade400, // Placeholder text
                          ),
                          const SizedBox(height: 6),
                          Container(
                            width: 100, // Approximate text width
                            height: 16, // Approximate text height
                            color: Colors.grey.shade400, // Placeholder text
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
  }
}
