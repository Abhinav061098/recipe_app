import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../provider/latest_recipe_provider.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:card_swiper/card_swiper.dart';
import '../../models/recipe.dart';
import '../../shimmers/shimmer_loading.dart'; // Import the shimmer loading widget

class LatestRecipesScreen extends StatelessWidget {
  final Function(Recipe) onRecipeTap;

  const LatestRecipesScreen({
    super.key,
    required this.onRecipeTap,
  });

  @override
  Widget build(BuildContext context) {
    final latestRecipeProvider = context.watch<LatestRecipeProvider>();

    return SizedBox(
      height: 250.0,
      child: latestRecipeProvider.isLoading
          ? _buildShimmer() // Show shimmer while loading
          : latestRecipeProvider.latestRecipes.isEmpty
              ? const Center(child: Text('No latest recipes found.'))
              : Swiper(
                  itemBuilder: (BuildContext context, int index) {
                    final recipe = latestRecipeProvider.latestRecipes[index];
                    return GestureDetector(
                      onTap: () => onRecipeTap(recipe),
                      child: Stack(
                        children: [
                          CachedNetworkImage(
                            imageUrl: recipe.strMealThumb,
                            fit: BoxFit.cover,
                            width: double.infinity,
                            height: double.infinity,
                            placeholder: (context, url) => const Center(
                                child: CircularProgressIndicator()),
                            errorWidget: (context, url, error) =>
                                const Icon(Icons.error),
                          ),
                          Positioned(
                            bottom: 0,
                            left: 0,
                            right: 0,
                            child: Container(
                              color: Colors.black.withOpacity(0.5),
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                recipe.strMeal.isNotEmpty
                                    ? recipe.strMeal
                                    : 'Recipe',
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                  itemCount: latestRecipeProvider.latestRecipes.length,
                  autoplay: true,
                  pagination: null,
                  control: const SwiperControl(),
                ),
    );
  }

  // Custom shimmer widget directly inside the screen
  Widget _buildShimmer() {
    return SizedBox(
      height: 250.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 3,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: ShimmerLoading(
              child: Container(
                width: MediaQuery.of(context).size.width * 1.0,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[400],
                          borderRadius:
                              BorderRadius.vertical(top: Radius.circular(10)),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 20,
                        color: Colors.grey[400],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
