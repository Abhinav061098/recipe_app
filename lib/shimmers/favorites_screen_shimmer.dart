import 'package:flutter/material.dart';
import 'package:soopfood/shimmers/shimmer_loading.dart';

class FavoritesScreenShimmer extends StatelessWidget {
  const FavoritesScreenShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
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
              margin: EdgeInsets.symmetric(vertical: 8),
              child: ListTile(
                contentPadding: EdgeInsets.all(10),
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    width: 60,
                    height: 60,
                    color: Colors.grey[300],
                  ),
                ),
                title: Container(
                  width: 150,
                  height: 16,
                  color: Colors.grey[400],
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
