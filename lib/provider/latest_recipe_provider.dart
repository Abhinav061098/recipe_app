import 'package:flutter/material.dart';
import '../services/spoonfood_service.dart';
import '../models/recipe.dart';

class LatestRecipeProvider with ChangeNotifier {
  final SpoonfoodService _spoonfoodService = SpoonfoodService();
  List<Recipe> _latestRecipes = [];
  bool _isLoading = false;
  String? _errorMessage;

  List<Recipe> get latestRecipes => _latestRecipes;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  Future<void> fetchLatestRecipes() async {
    print('fetchLatestRecipes called');
    _isLoading = true;
    notifyListeners();

    try {
      final List<dynamic> fetchedRecipes =
          await _spoonfoodService.getRandomMeals(10); // get 10 random meals.
      _latestRecipes = fetchedRecipes
          .where((recipe) => recipe['strMealThumb'] != null)
          .map((e) => Recipe.fromJson(e))
          .toList();
      _isLoading = false;
      notifyListeners();

      print('Latest recipes fetched (with images): ${_latestRecipes.length}');
    } catch (e) {
      _isLoading = false;
      notifyListeners();
      _errorMessage = e.toString();
      print('Error fetching latest recipes: $e');
    }
  }
}
