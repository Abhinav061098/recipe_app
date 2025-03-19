import 'package:flutter/material.dart';
import '../services/spoonfood_service.dart';
import 'dart:math';
import '../models/recipe.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class RandomMealProvider with ChangeNotifier {
  final SpoonfoodService _spoonfoodService = SpoonfoodService();
  Recipe? _randomMeal;
  bool _isLoading = false;
  bool _isShimmerLoading = false;

  Recipe? get randomMeal => _randomMeal;
  bool get isLoading => _isLoading;
  bool get isShimmerLoading => _isShimmerLoading;

  Future<void> fetchRandomMeal() async {
    _isShimmerLoading = true;
    _isLoading = true;
    notifyListeners();
    try {
      List<dynamic> meals = await _spoonfoodService.getRandomMeals(10);
      if (meals.isNotEmpty) {
        final randomIndex = Random().nextInt(meals.length);
        final mealData = meals[randomIndex];
        _randomMeal = Recipe.fromJson(mealData);
      }
    } catch (e) {
      print("Error fetching random meal: $e");
    }
    _isShimmerLoading = false;
    _isLoading = false;
    notifyListeners();
  }
}
