import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/recipe.dart';

class SpoonfoodService {
  final String _baseUrl = 'https://www.themealdb.com/api/json/v1/1';

  Future<List<dynamic>> searchRecipes(String query) async {
    print('searchRecipes called with query: $query');
    final url = Uri.parse('$_baseUrl/search.php?s=$query');

    try {
      final response = await http.get(url).timeout(const Duration(seconds: 10));

      if (response.statusCode == 200) {
        print('API Response: ${response.body}');
        final data = json.decode(response.body);
        return data['meals'] ?? [];
      } else {
        print('API Error: ${response.statusCode}');
        throw Exception('Failed to load recipes: ${response.statusCode}');
      }
    } catch (e) {
      print('API Error: $e');
      print('API URL: $url');
      throw Exception('Failed to load recipes: $e');
    }
  }

  Future<dynamic> getRecipeInformation(String recipeId) async {
    final url = Uri.parse('$_baseUrl/lookup.php?i=$recipeId');
    try {
      final response = await http.get(url).timeout(const Duration(seconds: 10));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return data['meals']?[0];
      } else {
        throw Exception('Failed to load recipe information');
      }
    } catch (e) {
      throw Exception('Failed to load recipe information: $e');
    }
  }

  Future<List<dynamic>> getRandomMeals(int count) async {
    try {
      List<Future<http.Response>> requests = List.generate(
          count, (_) => http.get(Uri.parse("$_baseUrl/random.php")));

      List<http.Response> responses = await Future.wait(requests);

      List<dynamic> meals = responses
          .where((response) => response.statusCode == 200)
          .map((response) => json.decode(response.body)['meals']?[0])
          .where((meal) => meal != null)
          .toList();

      return meals;
    } catch (e) {
      print("Error fetching random meals: $e");
      return [];
    }
  }

  Future<List<dynamic>> fetchRecipesByCategory(String category) async {
    final response = await http.get(Uri.parse(
        'https://www.themealdb.com/api/json/v1/1/filter.php?c=$category'));

    if (response.statusCode == 200) {
      final decodedData = json.decode(response.body);
      return decodedData['meals'] ?? [];
    } else {
      throw Exception('Failed to fetch category recipes');
    }
  }

  Future<List<dynamic>> fetchRecipesByIngredient(String ingredient) async {
    final url = Uri.parse('$_baseUrl/filter.php?i=$ingredient');
    try {
      final response = await http.get(url).timeout(const Duration(seconds: 10));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return data['meals'] ?? [];
      } else {
        throw Exception('Failed to load recipes by ingredient');
      }
    } catch (e) {
      throw Exception('Failed to load recipes by ingredient: $e');
    }
  }

  Future<List<Map<String, dynamic>>> fetchRecipeDetails(String mealId) async {
    final response = await http.get(Uri.parse(
        'https://www.themealdb.com/api/json/v1/1/lookup.php?i=$mealId'));

    if (response.statusCode == 200) {
      final decodedData = json.decode(response.body);
      return (decodedData['meals'] as List?)?.cast<Map<String, dynamic>>() ??
          [];
    } else {
      throw Exception('Failed to load recipe details');
    }
  }

  Future<Recipe> getRandomMeal() async {
    final response = await http
        .get(Uri.parse('https://www.themealdb.com/api/json/v1/1/random.php'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      if (data['meals'] != null && data['meals'].isNotEmpty) {
        return Recipe.fromJson(data['meals'][0]);
      } else {
        throw Exception('No meals found');
      }
    } else {
      throw Exception('Failed to load random meal');
    }
  }
}
