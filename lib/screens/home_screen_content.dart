import 'package:flutter/material.dart';
import 'package:soopfood/screens/recipe_details_screen.dart';
import 'package:soopfood/widgets/recent_search_widget.dart';
import 'package:soopfood/widgets/recently_viewed_recipes_widget.dart';
import 'package:provider/provider.dart';
import 'package:soopfood/provider/recipe_provider.dart';
import 'package:soopfood/widgets/shimmers/meal_of_day_shimmer.dart';
import 'package:soopfood/widgets/shimmers/recent_search_shimmer.dart';
import 'package:soopfood/widgets/shimmers/recently_viewed_recipes_shimmer.dart';
import 'package:soopfood/widgets/shimmers/recommended_recipes_shimmer.dart';
import 'package:soopfood/screens/search_results_screen.dart';
import '../screens/latest_recipes_screen.dart';
import '../widgets/categories_widget.dart';
import '../widgets/random_meal_widget.dart';
import '../widgets/cuisine_list.dart';
import '../widgets/recommended_recipes_widget.dart';
import '../widgets/meal_of_the_day_widget.dart';
//shimmer import
import '../widgets/shimmers/latest_recipes_shimmer.dart';
import '../widgets/shimmers/cuisine_list_shimmer.dart';
import '../widgets/shimmers/categories_widget_shimmer.dart';
import '../widgets/shimmers/random_meal_shimmer.dart';
import '../screens/floating_search_button.dart'; // Import the new widget

class HomeScreenContent extends StatelessWidget {
  final TextEditingController searchController;

  HomeScreenContent({required this.searchController});

  @override
  Widget build(BuildContext context) {
    return Consumer<RecipeProvider>(
      builder: (context, recipeProvider, child) {
        return recipeProvider.isLoading
            ? _buildShimmerLoading()
            : Stack(
                children: [
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        _buildView(context, recipeProvider), // Pass context
                      ],
                    ),
                  ),
                  FloatingSearchButton(
                      searchController:
                          searchController), // Add the extracted widget
                ],
              );
      },
    );
  }

  Widget _buildView(BuildContext context, RecipeProvider recipeProvider) {
    // Add context parameter
    return Column(
      children: [
        CuisineList(),
        LatestRecipesScreen(
          onRecipeTap: (recipe) {
            Navigator.push(
              context, // Now context is available
              MaterialPageRoute(
                builder: (context) => RecipeDetailsScreen(recipe: recipe),
              ),
            );
          },
        ),
        CategoriesWidget(),
        RandomMealWidget(),
        RecommendedRecipesWidget(),
        RecentlyViewedRecipesWidget(),
        RecentSearchWidget(
          onSearchTap: (query) {
            print('Search term tapped: $query');
            Navigator.push(
              context, // Now context is available
              MaterialPageRoute(
                builder: (context) => SearchResultsScreen(query: query),
              ),
            );
          },
        ),
        MealOfDayWidget(),
      ],
    );
  }

  Widget _buildShimmerLoading() {
    return SingleChildScrollView(
      child: Column(
        children: [
          CuisineListShimmer(),
          LatestRecipesShimmer(),
          CategoriesWidgetShimmer(),
          RandomMealShimmer(),
          RecommendedRecipesShimmer(),
          RecentlyViewedRecipesShimmer(),
          RecentSearchShimmer(),
          MealOfDayShimmer(),
        ],
      ),
    );
  }
}
