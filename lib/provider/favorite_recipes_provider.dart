import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import '../models/recipe.dart';

class FavoriteRecipesProvider with ChangeNotifier {
  List<Recipe> _favoriteRecipes = [];
  bool _isLoading = false;

  List<Recipe> get favoriteRecipes => _favoriteRecipes;
  bool get isLoading => _isLoading;

  FavoriteRecipesProvider() {
    loadFavorites();
  }

  Future<void> loadFavorites() async {
    _isLoading = true;
    notifyListeners();

    final prefs = await SharedPreferences.getInstance();
    final favoritesJson = prefs.getStringList('favoriteRecipes');

    if (favoritesJson != null) {
      try {
        _favoriteRecipes = favoritesJson
            .map((json) => Recipe.fromJson(jsonDecode(json)))
            .toList();
      } catch (e) {
        print('Error decoding favorites from SharedPreferences: $e');
        _favoriteRecipes = [];
      }
    } else {
      _favoriteRecipes = [];
    }

    _isLoading = false;
    notifyListeners();
  }

  Future<void> _saveFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    final favoritesJson =
        _favoriteRecipes.map((recipe) => jsonEncode(recipe.toJson())).toList();
    await prefs.setStringList('favoriteRecipes', favoritesJson);
  }

  void toggleFavorite(Recipe recipe) async {
    _isLoading = true;
    notifyListeners();

    final isFavorite = _favoriteRecipes.any((r) => r.idMeal == recipe.idMeal);

    if (isFavorite) {
      _favoriteRecipes.removeWhere((r) => r.idMeal == recipe.idMeal);
    } else {
      _favoriteRecipes.add(recipe);
    }

    await _saveFavorites();
    _isLoading = false;
    notifyListeners();
  }

  Future<bool> isFavorite(Recipe recipe) async {
    return _favoriteRecipes.any((r) => r.idMeal == recipe.idMeal);
  }

  void removeFavoriteRecipe(Recipe recipe) async {
    _isLoading = true;
    notifyListeners();

    _favoriteRecipes.removeWhere((r) => r.idMeal == recipe.idMeal);
    await _saveFavorites();

    _isLoading = false;
    notifyListeners();
  }
}
