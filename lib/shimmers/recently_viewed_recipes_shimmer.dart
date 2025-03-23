// lib/widgets/shimmer/recently_viewed_recipes_shimmer.dart
import 'package:flutter/material.dart';
import 'package:soopfood/shimmers/shimmer_loading.dart'; // Import generic ShimmerLoading

class RecentlyViewedRecipesShimmer extends StatelessWidget {
  const RecentlyViewedRecipesShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 8.0),
          child: ShimmerLoading(
            child: Container(
              width: 200, // Approximate width of the title
              height: 20, // Approximate height of the title
              color: Colors.grey[300],
            ),
          ),
        ),
        SizedBox(
          height: 150.0, // Increased height
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 5, // Assuming 5 shimmer cards
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: ShimmerLoading(
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 6,
                              offset: Offset(3, 3),
                            ),
                          ],
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(14.0),
                          child: Container(
                            // Placeholder for CachedNetworkImage
                            width: 120.0, // Increased width
                            height: 110.0, // Increased height
                            color: Colors.grey[300],
                          ),
                        ),
                      ),
                      SizedBox(height: 8.0),
                      Container(
                        // Placeholder for text
                        width: 120.0, // Adjusted width
                        height: 16, // Approximate text height
                        color: Colors.grey[300],
                      ),
                    ],
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
