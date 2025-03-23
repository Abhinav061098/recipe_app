import 'package:flutter/material.dart';
import '../models/recipe.dart';
import 'favorite_recipes_provider.dart';
import 'recently_viewed_recipes_provider.dart';
import 'random_meal_provider.dart';
import 'dart:math';

class RecommendedRecipeProvider with ChangeNotifier {
  final List<Recipe> _recommendedRecipes = [];

  List<Recipe> get recommendedRecipes => _recommendedRecipes;
  bool isLoading = false;

  Future<void> fetchRecommendedRecipes(
    FavoriteRecipesProvider favoriteProvider,
    RecentlyViewedRecipesProvider viewedProvider,
    RandomMealProvider randomMealProvider,
  ) async {
    isLoading = true;
    notifyListeners();

    try {
      List<Recipe> favorites = favoriteProvider.favoriteRecipes;
      List<Recipe> recentlyViewed = viewedProvider.recentlyViewed;
      List<Recipe> randomMeals = [
        if (randomMealProvider.randomMeal != null)
          randomMealProvider.randomMeal!
      ];
      // Combine all lists & remove duplicates using a Set
      Set<String> uniqueRecipeIds = {}; // Stores unique IDs
      List<Recipe> combinedList = [];

      void addUnique(List<Recipe> recipes) {
        for (var recipe in recipes) {
          if (recipe.idMeal.isNotEmpty &&
              !uniqueRecipeIds.contains(recipe.idMeal)) {
            uniqueRecipeIds.add(recipe.idMeal);
            combinedList.add(recipe);
          }
        }
      }

      addUnique(favorites);
      addUnique(recentlyViewed);
      addUnique(randomMeals);

      print("Combined List (before shuffle): ${combinedList.length}");

      // Shuffle the final list randomly
      combinedList.shuffle(Random());

      // Keep only 15 items
      _recommendedRecipes
        ..clear()
        ..addAll(combinedList.where((recipe) => recipe != null).take(15));

      print("Recommended Recipes: ${_recommendedRecipes.length}");
    } catch (e) {
      print("Error fetching recommended recipes: $e");
    }

    isLoading = false;
    notifyListeners();
  }
}
