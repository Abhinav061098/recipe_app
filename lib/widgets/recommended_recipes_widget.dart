import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:soopfood/provider/favorite_recipes_provider.dart';
import 'package:soopfood/provider/random_meal_provider.dart';
import 'package:soopfood/provider/recently_viewed_recipes_provider.dart';
import '../provider/recommended_recipe_provider.dart';
import '../widgets/recipe_card.dart';
import '../screens/recipe_details_screen.dart';

class RecommendedRecipesWidget extends StatefulWidget {
  @override
  _RecommendedRecipesWidgetState createState() =>
      _RecommendedRecipesWidgetState();
}

class _RecommendedRecipesWidgetState extends State<RecommendedRecipesWidget> {
  @override
  void initState() {
    super.initState();
    // Wait for FavoriteRecipesProvider to finish loading
    Future.microtask(() {
      // Wait until all providers finish loading their data
      _loadData();
    });
  }

  Future<void> _loadData() async {
    // Wait until the FavoriteRecipesProvider is done loading
    await Future.wait([
      Provider.of<FavoriteRecipesProvider>(context, listen: false)
          .loadFavorites(),
      // Wait for RecentlyViewed and RandomMeal to finish loading as well
      Provider.of<RecentlyViewedRecipesProvider>(context, listen: false)
          .loadRecentlyViewed(),
      Provider.of<RandomMealProvider>(context, listen: false).fetchRandomMeal(),
    ]);

    // Now fetch recommended recipes after all providers are ready
    Provider.of<RecommendedRecipeProvider>(context, listen: false)
        .fetchRecommendedRecipes(context);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<RecommendedRecipeProvider>(
      builder: (context, recommendedProvider, child) {
        bool isDataReady = recommendedProvider.recommendedRecipes.isNotEmpty &&
            recommendedProvider.recommendedRecipes.every(
              (recipe) =>
                  recipe.strMeal.isNotEmpty && recipe.strMealThumb.isNotEmpty,
            );

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
              child: Text(
                "Recommended for You 🍽️",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 6),
            if (!isDataReady && recommendedProvider.isLoading)
              SizedBox(
                height: 152,
                child: Center(child: CircularProgressIndicator()),
              )
            else if (recommendedProvider.recommendedRecipes.isEmpty)
              const Padding(
                padding: EdgeInsets.all(12.0),
                child: Center(child: Text("No recommendations available.")),
              )
            else
              SizedBox(
                height: 152,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: recommendedProvider.recommendedRecipes.length,
                  itemBuilder: (context, index) {
                    final recipe =
                        recommendedProvider.recommendedRecipes[index];

                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 6.0),
                      child: GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                RecipeDetailsScreen(recipe: recipe),
                          ),
                        ),
                        child: SizedBox(
                          width: 150,
                          child: RecipeCard(
                            recipe: recipe,
                            titleFontSize: 12,
                            subtitleFontSize: 0,
                          ),
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
