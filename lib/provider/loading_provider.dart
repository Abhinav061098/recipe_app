import 'package:flutter/material.dart';

class LoadingProvider with ChangeNotifier {
  bool _isShimmerLoading = true;

  bool get isShimmerLoading => _isShimmerLoading;

  void setShimmerLoading(bool value) {
    _isShimmerLoading = value;
    notifyListeners();
  }
}
