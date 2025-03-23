import 'package:flutter/material.dart';
import 'package:soopfood/shimmers/shimmer_loading.dart';

class MealOfDayShimmer extends StatelessWidget {
  const MealOfDayShimmer({super.key});

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
        child: SizedBox(
          height: 250.0,
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(24),
                    bottomLeft: Radius.circular(24),
                  ),
                  child: Container(
                    color: Colors.grey[800],
                  ),
                ),
              ),
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
                        width: 180,
                        height: 30,
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
                        width: 150,
                        height: 25,
                        color: Colors.grey[800],
                      ),
                      SizedBox(height: 8),
                      Container(
                        width: 100,
                        height: 16,
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
