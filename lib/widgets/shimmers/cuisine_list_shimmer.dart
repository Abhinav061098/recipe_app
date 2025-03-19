// lib/widgets/shimmer/cuisine_list_shimmer.dart
import 'package:flutter/material.dart';
import '../shimmers/shimmer_loading.dart'; // Import generic ShimmerLoading

class CuisineListShimmer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ShimmerLoading(
      child: SizedBox(
        height: 50.0,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 8,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6.0),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(20),
                ),
                width: 80,
              ),
            );
          },
        ),
      ),
    );
  }
}
