// // cuisine_recipe_provider.dart

// import 'package:flutter/material.dart';
// import '../services/spoonfood_service.dart';
// import '../models/recipe.dart';

// class CuisineRecipeProvider with ChangeNotifier {
//   final SpoonfoodService _spoonfoodService = SpoonfoodService();
//   List<Recipe> _cuisineRecipes = [];
//   List<Recipe> get cuisineRecipes => _cuisineRecipes;
//   bool _isLoading = false;
//   bool get isLoading => _isLoading;
//   String? _errorMessage;
//   String? get errorMessage => _errorMessage;

//   Future<void> fetchCuisineRecipes(String cuisine) async {
//     _isLoading = true;
//     notifyListeners();

//     try {
//       final meals = await _spoonfoodService.fetchRecipesByCategory(cuisine);
//       _cuisineRecipes = meals.map((meal) => Recipe.fromJson(meal)).toList();
//     } catch (e) {
//       _errorMessage = e.toString();
//       _cuisineRecipes = [];
//     }

//     _isLoading = false;
//     notifyListeners();
//   }
// }
