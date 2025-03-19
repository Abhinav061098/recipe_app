// // home_screen_content.dart

// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import '../provider/recipe_provider.dart';
// import '../screens/recipe_details_screen.dart';
// import '../screens/search_results_screen.dart';
// import '../screens/latest_recipes_screen.dart';
// import '../widgets/categories_widget.dart';
// import '../widgets/random_meal_widget.dart';
// import '../widgets/cuisine_list.dart';
// import '../widgets/recommended_recipes_widget.dart';
// import '../widgets/recently_viewed_recipes_widget.dart';
// import '../widgets/recent_search_widget.dart';
// import '../widgets/meal_of_the_day_widget.dart';
// import '../widgets/shimmers/latest_recipes_shimmer.dart';
// import '../widgets/shimmers/cuisine_list_shimmer.dart';
// import '../widgets/shimmers/categories_widget_shimmer.dart';
// import '../widgets/shimmers/random_meal_shimmer.dart';
// import '../widgets/shimmers/recommended_recipes_shimmer.dart';
// import '../widgets/shimmers/recently_viewed_recipes_shimmer.dart';
// import '../widgets/shimmers/recent_search_shimmer.dart';
// import '../widgets/shimmers/meal_of_day_shimmer.dart';

// class HomeScreenContent extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Consumer<RecipeProvider>(
//       builder: (context, recipeProvider, child) {
//         return recipeProvider.isLoading
//             ? _buildShimmerLoading() // Show shimmer loading
//             : SingleChildScrollView(
//                 child: Column(
//                   children: [
//                     CuisineList(),
//                     LatestRecipesScreen(
//                       recipeProvider: recipeProvider,
//                       onRecipeTap: (recipe) {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) =>
//                                 RecipeDetailsScreen(recipe: recipe),
//                           ),
//                         );
//                       },
//                     ),
//                     CategoriesWidget(),
//                     RandomMealWidget(),
//                     RecommendedRecipesWidget(),
//                     RecentlyViewedRecipesWidget(),
//                     RecentSearchWidget(
//                       onSearchTap: (query) {
//                         print('Search term tapped: $query');
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) =>
//                                 SearchResultsScreen(query: query),
//                           ),
//                         );
//                       },
//                     ),
//                     MealOfDayWidget(),
//                   ],
//                 ),
//               );
//       },
//     );
//   }

//   Widget _buildShimmerLoading() {
//     return SingleChildScrollView(
//       child: Column(
//         children: [
//           CuisineListShimmer(),
//           LatestRecipesShimmer(),
//           CategoriesWidgetShimmer(),
//           RandomMealShimmer(),
//           RecommendedRecipesShimmer(),
//           RecentlyViewedRecipesShimmer(),
//           RecentSearchShimmer(),
//           MealOfDayShimmer(),
//         ],
//       ),
//     );
//   }
// }
