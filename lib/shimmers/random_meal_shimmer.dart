import 'package:flutter/material.dart';
import 'shimmer_loading.dart';

class RandomMealShimmer extends StatelessWidget {
  const RandomMealShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
          child: ShimmerLoading(
            child: Container(
              width: 150,
              height: 20,
              color: Colors.grey[300],
            ),
          ),
        ),
        SizedBox(height: 6),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(10, (index) {
              return Container(
                width: 120,
                margin: EdgeInsets.all(6.0),
                child: Card(
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      ClipRRect(
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(10)),
                        child: ShimmerLoading(
                          child: Container(
                            width: double.infinity,
                            height: 100,
                            color: Colors.grey[300],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: ShimmerLoading(
                          child: Container(
                            height: 16,
                            color: Colors.grey[300],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
          ),
        ),
      ],
    );
  }
}
