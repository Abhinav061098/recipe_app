// lib/widgets/shimmer/categories_widget_shimmer.dart
import 'package:flutter/material.dart';
import '../shimmers/shimmer_loading.dart'; // Import generic ShimmerLoading

class CategoriesWidgetShimmer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120.0, // Adjust height as needed
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 6, // Adjust number of shimmer categories
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: ShimmerLoading(
              child: Container(
                width: 100.0, // Adjust width as needed
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 60.0,
                      height: 60.0,
                      decoration: BoxDecoration(
                        color: Colors.grey[400],
                        shape: BoxShape.circle,
                      ),
                    ),
                    SizedBox(height: 8.0),
                    Container(
                      height: 16.0,
                      width: 80.0,
                      color: Colors.grey[400],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
