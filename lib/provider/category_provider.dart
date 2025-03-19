import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../services/spoonfood_service.dart';
import 'dart:convert';
import '../models/category.dart';
import 'dart:math';
import '../models/recipe.dart';

class CategoryProvider with ChangeNotifier {
  final SpoonfoodService _spoonfoodService = SpoonfoodService();
  List<Category> _widgetCategories = [];
  List<Category> _screenCategories = [];
  List<Recipe> _filteredRecipes = [];
  final Set<String> _usedImageUrls = {};
  bool _isLoading = false;
  String? _errorMessage;

  List<Category> get widgetCategories => _widgetCategories;
  List<Category> get screenCategories => _screenCategories;
  List<Recipe> get filteredRecipes => _filteredRecipes;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  // Future<void> filterRecipesByCategory(String category) async {
  //   _isLoading = true;
  //   notifyListeners();

  //   try {
  //     final fetchedRecipes =
  //         await _spoonfoodService.fetchRecipesByCategory(category);
  //     _filteredRecipes = fetchedRecipes
  //         .map((meal) => Recipe.fromJson(meal))
  //         .where((recipe) =>
  //             recipe.strCategory?.toLowerCase() == category.toLowerCase())
  //         .toList();

  //     print(
  //         'Filtered Recipes: ${_filteredRecipes.map((r) => r.strMeal).toList()}');
  //     print(
  //         'Filtered Recipe Categories: ${_filteredRecipes.map((r) => r.strCategory).toList()}');
  //     _isLoading = false;
  //     notifyListeners();
  //   } catch (e) {
  //     _isLoading = false;
  //     _errorMessage = e.toString();
  //     print('Error filtering recipes: $e');
  //     notifyListeners();
  //   }
  // }

  Future<void> fetchCategories() async {
    _isLoading = true;
    notifyListeners();
    _usedImageUrls.clear();
    List<String> categories = [
      'Side',
      'Vegan',
      'Vegetarian',
      'Chicken',
      'Dessert',
      'Pasta',
      'Pork',
      'Seafood',
      'Starter',
      'Lamb'
    ];

    List<Future<Category?>> categoryFutures = categories.map((category) async {
      try {
        List<dynamic> recipes = await _spoonfoodService.searchRecipes(category);

        if (recipes.isNotEmpty) {
          dynamic randomRecipe;
          String? imageUrl;
          String? recipeId;
          bool uniqueImage = false;
          int attempts = 0;

          while (!uniqueImage && attempts < 20) {
            randomRecipe =
                recipes[(recipes.length * Random().nextDouble()).toInt()];
            if (randomRecipe['strMealThumb'] != null) {
              imageUrl = randomRecipe['strMealThumb'];
              recipeId = randomRecipe['idMeal'];
              if (!_usedImageUrls.contains(imageUrl)) {
                uniqueImage = true;
              } else {
                attempts++;
              }
            } else {
              attempts++;
            }
          }

          if (uniqueImage && imageUrl != null && recipeId != null) {
            _usedImageUrls.add(imageUrl);
            return Category(
              name: category,
              imageUrl: imageUrl,
              recipeId: recipeId,
            );
          } else {
            print("could not find a unique image for $category");
            return null;
          }
        }
      } catch (e) {
        print('Error fetching recipes for $category: $e');
        return null;
      }
      return null;
    }).toList();

    List<Category?> fetchedCategories = await Future.wait(categoryFutures);
    _widgetCategories =
        fetchedCategories.whereType<Category>().toList(); // Filter out nulls
    _isLoading = false;
    notifyListeners();
  }

  Future<void> fetchAllCategories() async {
    _isLoading = true;
    notifyListeners();
    try {
      final response = await http.get(
          Uri.parse('https://www.themealdb.com/api/json/v1/1/categories.php'));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final List<dynamic> categoriesData = data['categories'];
        List<Category> fetchedCategories = [];

        for (var categoryData in categoriesData) {
          fetchedCategories.add(Category.fromJson(categoryData));
        }

        _screenCategories = fetchedCategories;
        notifyListeners();
      } else {
        print('Failed to load categories: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching categories: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
