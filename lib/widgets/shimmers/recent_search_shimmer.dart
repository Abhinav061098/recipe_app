import 'package:flutter/material.dart';
import 'package:soopfood/widgets/shimmers/shimmer_loading.dart'; // Import the shimmer loading widget

class RecentSearchShimmer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          child: ShimmerLoading(
            child: Container(
              width: 150, // Approximate width of the title
              height: 20, // Approximate height of the title
              color: Colors.grey[300],
            ),
          ),
        ),
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: List.generate(10, (index) {
                return Padding(
                  padding: EdgeInsets.only(right: 8),
                  child: ShimmerLoading(
                    child: Chip(
                      label: Container(
                        width: 80, // Approximate chip width
                        height: 16, // Approximate chip height
                        color: Colors.grey[300],
                      ),
                      backgroundColor: Colors.white,
                      elevation: 3,
                      shadowColor: Colors.grey.withOpacity(0.5),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),
        ),
      ],
    );
  }
}
