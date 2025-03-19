import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RecentSearchProvider with ChangeNotifier {
  Future<void> addRecentSearch(String query) async {
    print('addRecentSearch called with query: $query');
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> recentSearches = prefs.getStringList('recentSearches') ?? [];
    if (!recentSearches.contains(query)) {
      recentSearches.add(query);
      if (recentSearches.length > 5) {
        recentSearches.removeAt(0);
      }
      await prefs.setStringList('recentSearches', recentSearches);
      notifyListeners();
    }
  }

  Future<List<String>> getRecentSearches() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> recentSearches = prefs.getStringList('recentSearches') ?? [];
    return recentSearches.reversed
        .take(10)
        .toList(); // Get last 10 in reverse order
  }

  Future<void> clearRecentSearches() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('recentSearches', []);
    notifyListeners();
  }

  Future<void> removeRecentSearch(String query) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> recentSearches = prefs.getStringList('recentSearches') ?? [];

    recentSearches.remove(query); // Remove the specific search
    await prefs.setStringList('recentSearches', recentSearches);

    notifyListeners(); // Update UI
  }
}
