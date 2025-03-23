import 'package:flutter/material.dart';
import 'package:soopfood/shimmers/shimmer_loading.dart';

class CuisineRecipesScreenShimmer extends StatelessWidget {
  const CuisineRecipesScreenShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ListView.builder(
        itemCount: 6,
        physics: const NeverScrollableScrollPhysics(),
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
                      color: Colors.grey.shade300,
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(14.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 150,
                            height: 20,
                            color: Colors.grey.shade400,
                          ),
                          const SizedBox(height: 6),
                          Container(
                            width: 100,
                            height: 16,
                            color: Colors.grey.shade400,
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
