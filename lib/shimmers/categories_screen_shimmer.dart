// lib/screens/shimmer/categories_screen_shimmer.dart
import 'package:flutter/material.dart';
import 'package:soopfood/shimmers/shimmer_loading.dart'; // Import generic ShimmerLoading

class CategoriesScreenShimmer extends StatelessWidget {
  const CategoriesScreenShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 12.0,
          mainAxisSpacing: 12.0,
          childAspectRatio: 0.85,
        ),
        itemCount: 6, // Number of shimmer items (adjust as needed)
        itemBuilder: (context, index) {
          return ShimmerLoading(
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              elevation: 4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: ClipRRect(
                      borderRadius:
                          const BorderRadius.vertical(top: Radius.circular(15)),
                      child: Container(
                        color: Colors.grey[300], // Placeholder image
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    decoration: BoxDecoration(
                      color: Colors.deepOrangeAccent.withOpacity(0.9),
                      borderRadius: const BorderRadius.vertical(
                          bottom: Radius.circular(15)),
                    ),
                    child: Center(
                      child: Container(
                        width: 80, // Approximate text width
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
