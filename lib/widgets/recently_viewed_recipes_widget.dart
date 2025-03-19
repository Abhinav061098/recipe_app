import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/recently_viewed_recipes_provider.dart';
import '../screens/recipe_details_screen.dart';
import 'package:cached_network_image/cached_network_image.dart';

class RecentlyViewedRecipesWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<RecentlyViewedRecipesProvider>(
      builder: (context, recentlyViewedProvider, child) {
        if (recentlyViewedProvider.recentlyViewed.isEmpty) {
          return SizedBox.shrink();
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 14.0, vertical: 8.0),
              child: Text(
                'Recently Viewed Recipes',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 19,
                ),
              ),
            ),
            SizedBox(
              height: 150.0,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: recentlyViewedProvider.recentlyViewed.length,
                itemBuilder: (context, index) {
                  final recipe = recentlyViewedProvider.recentlyViewed[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                RecipeDetailsScreen(recipe: recipe),
                          ),
                        );
                      },
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
                              child: CachedNetworkImage(
                                imageUrl: recipe.strMealThumb,
                                width: 120.0,
                                height: 110.0,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          SizedBox(height: 8.0),
                          SizedBox(
                            width: 120.0,
                            child: Text(
                              recipe.strMeal,
                              textAlign: TextAlign.center,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: TextStyle(
                                  fontSize: 13.0, fontWeight: FontWeight.w700),
                            ),
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
      },
    );
  }
}
