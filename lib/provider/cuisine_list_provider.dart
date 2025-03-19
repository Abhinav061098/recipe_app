// cuisine_list_provider.dart

import 'package:flutter/material.dart';

class CuisineListProvider with ChangeNotifier {
  List<String> cuisineList = [
    'Indian',
    'Italian',
    'Chinese',
    'Mexican',
    'Japanese',
    'French',
    'Thai',
    'American',
    'Mediterranean',
    'Korean',
  ];

  List<String> getCuisines() {
    return cuisineList;
  }
}
