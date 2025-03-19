import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import '../models/recipe.dart';

class RecentlyViewedRecipesProvider with ChangeNotifier {
  List<Recipe> _recentlyViewed = [];

  List<Recipe> get recentlyViewed => _recentlyViewed;

  RecentlyViewedRecipesProvider() {
    loadRecentlyViewed();
  }

  Future<void> loadRecentlyViewed() async {
    final prefs = await SharedPreferences.getInstance();
    final recentlyViewedJson = prefs.getString('recentlyViewed');
    if (recentlyViewedJson != null) {
      final List<dynamic> decodedList = json.decode(recentlyViewedJson);
      _recentlyViewed =
          decodedList.map((item) => Recipe.fromJson(item)).toList();
    }
    notifyListeners();
  }

  Future<void> _saveRecentlyViewed() async {
    final prefs = await SharedPreferences.getInstance();
    final encodedList = _recentlyViewed.map((item) => item.toJson()).toList();
    await prefs.setString('recentlyViewed', json.encode(encodedList));
  }

  void addRecentlyViewed(Recipe recipe) {
    _recentlyViewed.removeWhere((item) => item.idMeal == recipe.idMeal);
    _recentlyViewed.insert(0, recipe);
    if (_recentlyViewed.length > 10) {
      _recentlyViewed.removeLast();
    }
    _saveRecentlyViewed();
    notifyListeners();
  }
}
