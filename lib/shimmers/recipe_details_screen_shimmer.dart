import 'package:flutter/material.dart';
import 'package:soopfood/shimmers/shimmer_loading.dart';

class RecipeDetailsScreenShimmer extends StatelessWidget {
  const RecipeDetailsScreenShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ShimmerLoading(
              child: Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.45,
                color: Colors.grey[300],
              ),
            ),
            SizedBox(height: 16),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: ShimmerLoading(
                child: Container(
                  width: 200,
                  height: 24,
                  color: Colors.grey[400],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ShimmerLoading(
                    child: Container(
                      width: 100,
                      height: 20,
                      color: Colors.grey[400],
                    ),
                  ),
                  ShimmerLoading(
                    child: Container(
                      width: 100,
                      height: 20,
                      color: Colors.grey[400],
                    ),
                  ),
                ],
              ),
            ),
            Divider(thickness: 1),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: ShimmerLoading(
                child: Container(
                  width: 150,
                  height: 20,
                  color: Colors.grey[400],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildShimmerDetailItem(),
                  _buildShimmerDetailItem(),
                ],
              ),
            ),
            Divider(thickness: 1),
            _buildShimmerSectionTitle(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: ShimmerLoading(
                child: Container(
                  width: double.infinity,
                  height: 100,
                  color: Colors.grey[400],
                ),
              ),
            ),
            Divider(thickness: 1),
            _buildShimmerSectionTitle(),
            _buildShimmerIngredientsList(),
            Divider(thickness: 1),
            _buildShimmerSectionTitle(),
            _buildShimmerStepsList(),
          ],
        ),
      ),
    );
  }

  Widget _buildShimmerSectionTitle() {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: ShimmerLoading(
        child: Container(
          width: 120,
          height: 22,
          color: Colors.grey[400],
        ),
      ),
    );
  }

  Widget _buildShimmerDetailItem() {
    return Column(
      children: [
        ShimmerLoading(
          child: Icon(Icons.category, size: 28, color: Colors.grey[400]),
        ),
        SizedBox(height: 4),
        ShimmerLoading(
          child: Container(
            width: 80,
            height: 16,
            color: Colors.grey[400],
          ),
        ),
      ],
    );
  }

  Widget _buildShimmerIngredientsList() {
    return Column(
      children: List.generate(3, (index) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ShimmerLoading(
                child: Container(
                  width: 120,
                  height: 16,
                  color: Colors.grey[400],
                ),
              ),
              ShimmerLoading(
                child: Container(
                  width: 40,
                  height: 16,
                  color: Colors.grey[400],
                ),
              ),
            ],
          ),
        );
      }),
    );
  }

  Widget _buildShimmerStepsList() {
    return Column(
      children: List.generate(3, (index) {
        return ListTile(
          leading: ShimmerLoading(
            child: Icon(Icons.circle, size: 12, color: Colors.grey[400]),
          ),
          title: ShimmerLoading(
            child: Container(
              width: double.infinity,
              height: 16,
              color: Colors.grey[400],
            ),
          ),
        );
      }),
    );
  }
}
