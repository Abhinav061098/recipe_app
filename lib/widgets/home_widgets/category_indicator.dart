import 'package:flutter/material.dart';

class CategoryIndicator extends StatelessWidget {
  final String category;

  const CategoryIndicator({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: _getCategoryColor(category),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        category,
        style: TextStyle(color: Colors.white),
      ),
    );
  }

  Color _getCategoryColor(String category) {
    if (category.toLowerCase() == 'vegetarian' ||
        category.toLowerCase() == 'vegan') {
      return Colors.green;
    } else if (category.toLowerCase() == 'seafood') {
      return Colors.blue;
    } else if (category.toLowerCase() == 'dessert') {
      return Colors.orange;
    } else {
      return Colors.red;
    }
  }
}
