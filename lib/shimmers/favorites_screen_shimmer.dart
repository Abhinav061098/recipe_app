// lib/screens/shimmer/favorites_screen_shimmer.dart
import 'package:flutter/material.dart';
import 'package:soopfood/shimmers/shimmer_loading.dart'; // Import generic ShimmerLoading

class FavoritesScreenShimmer extends StatelessWidget {
  const FavoritesScreenShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
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
              margin: EdgeInsets.symmetric(vertical: 8),
              child: ListTile(
                contentPadding: EdgeInsets.all(10),
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    width: 60,
                    height: 60,
                    color: Colors.grey[300], // Placeholder image
                  ),
                ),
                title: Container(
                  width: 150, // Approximate text width
                  height: 16, // Approximate text height
                  color: Colors.grey[400], // Placeholder text
                ),
                trailing: Icon(Icons.favorite, color: Colors.redAccent),
              ),
            ),
          );
        },
      ),
    );
  }
}
