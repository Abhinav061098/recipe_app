import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:soopfood/provider/recipe_provider.dart';
import '../../screens/sub_screen/cuisine_recipes_screen.dart';
import '../../provider/cuisine_list_provider.dart';
import '../../shimmers/cuisine_list_shimmer.dart';

class CuisineList extends StatelessWidget {
  const CuisineList({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CuisineListProvider>(
      builder: (context, cuisineListProvider, child) {
        final cuisines = cuisineListProvider.getCuisines();

        if (cuisines.isEmpty) {
          return CuisineListShimmer();
        }

        return SizedBox(
          height: 50.0,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: cuisines.length,
            itemBuilder: (context, index) {
              final cuisine = cuisines[index];

              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6.0),
                child: GestureDetector(
                  onTap: () {
                    context
                        .read<RecipeProvider>()
                        .fetchRecipes('', cuisine, context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            CuisineRecipesScreen(cuisine: cuisine),
                      ),
                    );
                  },
                  child: Chip(
                    label: Text(
                      cuisine,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.black87,
                      ),
                    ),
                    backgroundColor: Colors.grey[200],
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    elevation: 2,
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
