import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../provider/meal_of_day_provider.dart';
import '../../models/recipe.dart';
import '../../screens/sub_screen/recipe_details_screen.dart';
import 'package:cached_network_image/cached_network_image.dart';

class MealOfDayWidget extends StatefulWidget {
  const MealOfDayWidget({super.key});

  @override
  _MealOfDayWidgetState createState() => _MealOfDayWidgetState();
}

class _MealOfDayWidgetState extends State<MealOfDayWidget> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<MealOfDayProvider>(
      builder: (context, provider, child) {
        if (provider.isLoading) {
          return Center(child: CircularProgressIndicator());
        } else if (provider.mealOfDay != null) {
          Recipe meal = provider.mealOfDay!;
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => RecipeDetailsScreen(recipe: meal),
                ),
              );
            },
            child: Card(
              margin: EdgeInsets.all(16.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24),
              ),
              elevation: 6,
              color: Colors.black,
              child: SizedBox(
                height: 250.0,
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(24),
                          bottomLeft: Radius.circular(24),
                        ),
                        child: Stack(
                          children: [
                            CachedNetworkImage(
                              imageUrl: meal.strMealThumb,
                              width: double.infinity,
                              height: double.infinity,
                              fit: BoxFit.cover,
                            ),
                            Container(
                              width: double.infinity,
                              height: double.infinity,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [Colors.black54, Colors.transparent],
                                  begin: Alignment.bottomCenter,
                                  end: Alignment.topCenter,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 20.0,
                          horizontal: 16.0,
                        ),
                        child: SingleChildScrollView(
                          // Added SingleChildScrollView
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Meal of the Day",
                                style: TextStyle(
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.amber,
                                  letterSpacing: 1.5,
                                  shadows: [
                                    Shadow(
                                      blurRadius: 4.0,
                                      color: Colors.black45,
                                      offset: Offset(2, 2),
                                    ),
                                  ],
                                ),
                                textAlign: TextAlign.right,
                              ),
                              SizedBox(height: 8),
                              Divider(
                                color: Colors.white38,
                                thickness: 1.2,
                                indent: 20,
                                endIndent: 20,
                              ),
                              SizedBox(height: 8),
                              Text(
                                meal.strMeal,
                                style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white,
                                  fontStyle: FontStyle.italic,
                                ),
                                textAlign: TextAlign.right,
                              ),
                              SizedBox(height: 8),
                              Text(
                                "Tap to explore",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.white70,
                                ),
                                textAlign: TextAlign.right,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        } else {
          return Center(
            child: Text(
              'Meal of the day not available.',
              style: TextStyle(color: Colors.white70),
            ),
          );
        }
      },
    );
  }
}
