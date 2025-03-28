import 'package:flutter/material.dart';
import 'package:soopfood/shimmers/shimmer_loading.dart';

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
              width: 200,
              height: 20,
              color: Colors.grey[300],
            ),
          ),
        ),
        SizedBox(
          height: 150.0,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 5,
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
                            width: 120.0,
                            height: 110.0,
                            color: Colors.grey[300],
                          ),
                        ),
                      ),
                      SizedBox(height: 8.0),
                      Container(
                        width: 120.0,
                        height: 16,
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
