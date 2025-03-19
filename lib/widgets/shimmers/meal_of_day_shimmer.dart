// lib/widgets/shimmer/meal_of_day_shimmer.dart
import 'package:flutter/material.dart';
import 'package:soopfood/widgets/shimmers/shimmer_loading.dart'; // Import generic ShimmerLoading

class MealOfDayShimmer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ShimmerLoading(
      child: Card(
        margin: EdgeInsets.all(16.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        elevation: 6,
        color: Colors.black,
        child: Container(
          height: 250.0,
          child: Row(
            children: [
              // Left Half: Image with Gradient Overlay (Shimmer)
              Expanded(
                flex: 1,
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(24),
                    bottomLeft: Radius.circular(24),
                  ),
                  child: Container(
                    color: Colors.grey[800], // Placeholder color
                  ),
                ),
              ),
              // Right Half: Text with Stylish Design (Shimmer)
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 20.0, horizontal: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 180, // Approximate width of the title
                        height: 30, // Approximate height of the title
                        color: Colors.grey[800],
                      ),
                      SizedBox(height: 8),
                      Divider(
                          color: Colors.white38,
                          thickness: 1.2,
                          indent: 20,
                          endIndent: 20),
                      SizedBox(height: 8),
                      Container(
                        width: 150, // Approximate width of the meal name
                        height: 25, // Approximate height of the meal name
                        color: Colors.grey[800],
                      ),
                      SizedBox(height: 8),
                      Container(
                        width:
                            100, // Approximate width of the tap to explore text
                        height:
                            16, // Approximate height of the tap to explore text
                        color: Colors.grey[800],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
