// lib/screens/shimmer/recipe_details_screen_shimmer.dart
import 'package:flutter/material.dart';
import 'package:soopfood/shimmers/shimmer_loading.dart'; // Import generic ShimmerLoading

class RecipeDetailsScreenShimmer extends StatelessWidget {
  const RecipeDetailsScreenShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Shimmer for the image
            ShimmerLoading(
              child: Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.45,
                color: Colors.grey[300],
              ),
            ),
            SizedBox(height: 16),
            // Shimmer for the title
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: ShimmerLoading(
                child: Container(
                  width: 200, // Approximate title width
                  height: 24, // Approximate title height
                  color: Colors.grey[400],
                ),
              ),
            ),
            // Shimmer for category and cuisine
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ShimmerLoading(
                    child: Container(
                      width: 100, // Approximate category width
                      height: 20, // Approximate category height
                      color: Colors.grey[400],
                    ),
                  ),
                  ShimmerLoading(
                    child: Container(
                      width: 100, // Approximate cuisine width
                      height: 20, // Approximate cuisine height
                      color: Colors.grey[400],
                    ),
                  ),
                ],
              ),
            ),
            Divider(thickness: 1),
            // Shimmer for author
            Padding(
              padding: EdgeInsets.all(16.0),
              child: ShimmerLoading(
                child: Container(
                  width: 150, // Approximate author width
                  height: 20, // Approximate author height
                  color: Colors.grey[400],
                ),
              ),
            ),
            // Shimmer for details row
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
            // Shimmer for instructions title
            _buildShimmerSectionTitle(),
            // Shimmer for instructions text
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: ShimmerLoading(
                child: Container(
                  width: double.infinity,
                  height: 100, // Approximate instructions height
                  color: Colors.grey[400],
                ),
              ),
            ),
            Divider(thickness: 1),
            // Shimmer for ingredients title
            _buildShimmerSectionTitle(),
            // Shimmer for ingredients list
            _buildShimmerIngredientsList(),
            Divider(thickness: 1),
            // Shimmer for steps title
            _buildShimmerSectionTitle(),
            // Shimmer for steps list
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
          width: 120, // Approximate title width
          height: 22, // Approximate title height
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
            width: 80, // Approximate text width
            height: 16, // Approximate text height
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
                  width: 120, // Approximate ingredient width
                  height: 16, // Approximate ingredient height
                  color: Colors.grey[400],
                ),
              ),
              ShimmerLoading(
                child: Container(
                  width: 40, // Approximate measure width
                  height: 16, // Approximate measure height
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
              height: 16, // Approximate step height
              color: Colors.grey[400],
            ),
          ),
        );
      }),
    );
  }
}
