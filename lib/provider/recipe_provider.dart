import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../services/spoonfood_service.dart';
import 'dart:convert';
import '../models/recipe.dart';
import '../provider/cuisine_list_provider.dart';
import 'package:provider/provider.dart';

class RecipeProvider with ChangeNotifier {
  final SpoonfoodService _spoonfoodService = SpoonfoodService();
  List<Recipe> _recipes = [];
  List<Recipe> _latestRecipes = [];
  bool _isLoading = false;
  List<Recipe> _filteredRecipes = [];

  List<Recipe> get filteredRecipes => _filteredRecipes;
  List<Recipe> get recipes => _recipes;
  List<Recipe> get latestRecipes => _latestRecipes;
  bool get isLoading => _isLoading;

  get errorMessage => null;

  void filterRecipesByCategory(String category) async {
    _isLoading = true;
    notifyListeners();

    try {
      final fetchedRecipes =
          await _spoonfoodService.fetchRecipesByCategory(category);
      _filteredRecipes = fetchedRecipes
          .map((meal) => Recipe.fromJson(meal))
          .where((recipe) =>
              recipe.strCategory?.toLowerCase() ==
              category.toLowerCase()) // ✅ Fixed
          .toList();

      _filteredRecipes =
          fetchedRecipes.map((meal) => Recipe.fromJson(meal)).toList();
      print(
          'Filtered Recipes: ${_filteredRecipes.map((r) => r.strMeal).toList()}');
      print(
          'Filtered Recipe Categories: ${_filteredRecipes.map((r) => r.strCategory).toList()}');
      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _isLoading = false;
      print('Error filtering recipes: $e');
      notifyListeners();
    }
  }

  // Modified fetchRecipes to include BuildContext
  Future<void> fetchRecipes(
      String query, String cuisine, BuildContext context) async {
    print('fetchRecipes called with query: $query and cuisine: $cuisine');
    _isLoading = true;
    notifyListeners();

    try {
      String apiUrl = '';

      if (query.isNotEmpty) {
        final cuisineProvider =
            Provider.of<CuisineListProvider>(context, listen: false);
        final cuisineList =
            cuisineProvider.getCuisines(); // Access cuisineList via provider
        if (cuisineList.any((c) => c.toLowerCase() == query.toLowerCase())) {
          // Search by Cuisine
          apiUrl =
              'https://www.themealdb.com/api/json/v1/1/filter.php?a=$query';
        } else {
          // Search by Name, Category, or Ingredient
          List<String> apiUrls = [
            'https://www.themealdb.com/api/json/v1/1/search.php?s=$query', // Name
            'https://www.themealdb.com/api/json/v1/1/filter.php?c=$query', // Category
            'https://www.themealdb.com/api/json/v1/1/filter.php?i=$query', // Ingredient
          ];

          List<Recipe> combinedResults = [];

          for (String url in apiUrls) {
            final response = await http.get(Uri.parse(url));

            if (response.statusCode == 200) {
              final decodedData = json.decode(response.body);
              final meals = decodedData['meals'] as List?;

              if (meals != null) {
                combinedResults.addAll(
                    meals.map((meal) => Recipe.fromJson(meal)).toList());
              }
            }
          }

          _recipes = combinedResults;
          print('Recipes fetched: ${_recipes.map((r) => r.strMeal).toList()}');
          _isLoading = false;
          notifyListeners();
          return;
        }
      } else if (cuisine.isNotEmpty) {
        apiUrl =
            'https://www.themealdb.com/api/json/v1/1/filter.php?a=$cuisine';
      } else {
        _recipes = [];
        _isLoading = false;
        notifyListeners();
        return;
      }

      // Fetch data if apiUrl is set
      if (apiUrl.isNotEmpty) {
        final response = await http.get(Uri.parse(apiUrl));

        if (response.statusCode == 200) {
          final decodedData = json.decode(response.body);
          _recipes = (decodedData['meals'] as List?)
                  ?.map((meal) => Recipe.fromJson(meal))
                  .toList() ??
              [];

          print('Number of recipes fetched: ${_recipes.length}');
        } else {
          print('Failed to load recipes: ${response.statusCode}');
          _recipes = [];
        }
      }

      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _isLoading = false;
      _recipes = [];
      print('Error: $e');
      notifyListeners();
    }
  }
}
