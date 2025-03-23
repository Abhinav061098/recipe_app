import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import '../models/recipe.dart';
import '../services/spoonfood_service.dart';

class MealOfDayProvider with ChangeNotifier {
  final SpoonfoodService _spoonfoodService = SpoonfoodService();
  Recipe? _mealOfDay;
  bool _isLoading = false;

  Recipe? get mealOfDay => _mealOfDay;
  bool get isLoading => _isLoading;

  MealOfDayProvider() {
    _loadMealOfDay();
  }

  Future<void> _loadMealOfDay() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? mealJson = prefs.getString('mealOfDay');
    if (mealJson != null) {
      try {
        _mealOfDay = Recipe.fromJson(json.decode(mealJson));
        notifyListeners();
      } catch (e) {
        print("Error loading meal: $e");
        await fetchMealOfDay();
      }
    } else {
      await fetchMealOfDay();
    }
  }

  Future<void> fetchMealOfDay() async {
    _isLoading = true;
    notifyListeners();
    try {
      final meal = await _spoonfoodService.getRandomMeal();
      _mealOfDay = meal;
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('mealOfDay', json.encode(_mealOfDay!.toJson()));
    } catch (e) {
      print("Error fetching meal: $e");
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
