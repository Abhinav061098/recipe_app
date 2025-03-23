import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:soopfood/provider/meal_of_day_provider.dart';
import 'package:soopfood/provider/recipe_provider.dart';
import 'package:soopfood/provider/category_provider.dart';
import 'package:soopfood/provider/favorite_recipes_provider.dart';
// import 'package:soopfood/provider/recent_search_provider.dart';
import 'package:soopfood/provider/recently_viewed_recipes_provider.dart';
import 'package:soopfood/provider/random_meal_provider.dart';
import 'package:soopfood/provider/recommended_recipe_provider.dart';
import 'package:soopfood/provider/loading_provider.dart';
import 'package:soopfood/provider/cuisine_list_provider.dart';
import 'package:soopfood/provider/latest_recipe_provider.dart';
import 'package:soopfood/screens/login_screen/login_screen.dart';
import 'package:soopfood/screens/register_screen/register_screen.dart';
import 'package:soopfood/theme.dart';
import 'package:soopfood/screens/navigation_bar_screen/home_screen.dart';
// import 'package:soopfood/database/app_database.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'wrappers/auth_wrapper.dart';
import 'screens/login_screen/forgot_password_screen.dart';

// ValueNotifier to manage theme mode changes
final ValueNotifier<ThemeMode> themeModeNotifier =
    ValueNotifier(ThemeMode.light);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // Provider for the AppDatabase
        // Provider<AppDatabase>(
        //   create: (context) {
        //     try {
        //       return AppDatabase();
        //     } catch (e) {
        //       print('Error creating AppDatabase: $e');
        //       return AppDatabase(); // Or handle the error appropriately
        //     }
        //   },
        //   dispose: (context, db) => db.close(),
        // ),
        // ChangeNotifierProvider for RecipeProvider
        ChangeNotifierProvider(
          create: (context) {
            try {
              return RecipeProvider();
            } catch (e) {
              print('Error creating RecipeProvider: $e');
              return RecipeProvider(); // Or handle the error appropriately
            }
          },
        ),
        // ChangeNotifierProvider for LoadingProvider
        ChangeNotifierProvider(
          create: (context) {
            try {
              return LoadingProvider();
            } catch (e) {
              print('Error creating LoadingProvider: $e');
              return LoadingProvider(); // Or handle the error appropriately
            }
          },
        ),
        // ChangeNotifierProvider for FavoriteRecipesProvider
        ChangeNotifierProvider(
          create: (context) {
            try {
              return FavoriteRecipesProvider();
            } catch (e) {
              print('Error creating FavoriteRecipesProvider: $e');
              return FavoriteRecipesProvider(); // Or handle appropriately
            }
          },
        ),
        // ChangeNotifierProvider for RecentSearchProvider
        // ChangeNotifierProvider(
        //   create: (context) {
        //     try {
        //       return RecentSearchProvider();
        //     } catch (e) {
        //       print('Error creating RecentSearchProvider: $e');
        //       return RecentSearchProvider(); // Or handle appropriately
        //     }
        //   },
        // ),
        // ChangeNotifierProvider for RandomMealProvider
        ChangeNotifierProvider(
          create: (context) {
            try {
              return RandomMealProvider();
            } catch (e) {
              print('Error creating RandomMealProvider: $e');
              return RandomMealProvider(); // Or handle appropriately
            }
          },
        ),
        // ChangeNotifierProvider for RecommendedRecipeProvider
        ChangeNotifierProvider(
          create: (context) {
            try {
              return RecommendedRecipeProvider();
            } catch (e) {
              print('Error creating RecommendedRecipeProvider: $e');
              return RecommendedRecipeProvider(); // Or handle appropriately
            }
          },
        ),
        // ChangeNotifierProvider for RecentlyViewedRecipesProvider
        ChangeNotifierProvider(
          create: (context) {
            try {
              return RecentlyViewedRecipesProvider();
            } catch (e) {
              print('Error creating RecentlyViewedRecipesProvider: $e');
              return RecentlyViewedRecipesProvider(); // Or handle appropriately
            }
          },
        ),
        // ChangeNotifierProvider for CuisineListProvider
        ChangeNotifierProvider(
          create: (context) {
            try {
              return CuisineListProvider();
            } catch (e) {
              print('Error creating CategoryProvider: $e');
              return CuisineListProvider(); // Or handle appropriately
            }
          },
        ),
        // ChangeNotifierProvider for LatestRecipeProvider
        ChangeNotifierProvider(
          create: (context) {
            try {
              return LatestRecipeProvider();
            } catch (e) {
              print('Error creating CategoryProvider: $e');
              return LatestRecipeProvider(); // Or handle appropriately
            }
          },
        ),
        ChangeNotifierProvider(
          create: (context) {
            try {
              return MealOfDayProvider();
            } catch (e) {
              print('Error creating CategoryProvider: $e');
              return MealOfDayProvider(); // Or handle appropriately
            }
          },
        ),
        // ChangeNotifierProvider(
        //   create: (context) {
        //     try {
        //       return CuisineRecipeProvider();
        //     } catch (e) {
        //       print('Error creating CategoryProvider: $e');
        //       return CuisineRecipeProvider(); // Or handle appropriately
        //     }
        //   },
        // ),
        // ChangeNotifierProvider for CategoryProvider
        ChangeNotifierProvider(
          create: (context) {
            try {
              return CategoryProvider();
            } catch (e) {
              print('Error creating CategoryProvider: $e');
              return CategoryProvider(); // Or handle appropriately
            }
          },
        ),
        // ChangeNotifierProvider(
        //   create: (context) {
        //     try {
        //       return CuisineCategoryProvider();
        //     } catch (e) {
        //       print('Error creating CategoryProvider: $e');
        //       return CuisineCategoryProvider(); // Or handle appropriately
        //     }
        //   },
        // ),
      ],
      // ValueListenableBuilder to rebuild MaterialApp on theme changes
      child: ValueListenableBuilder<ThemeMode>(
        valueListenable: themeModeNotifier,
        builder: (context, themeMode, child) {
          return MaterialApp(
            title: 'SpoonFood',
            theme: lightTheme(),
            darkTheme: darkTheme(),
            themeMode: themeMode,
            home: AuthWrapper(),
            routes: {
              '/login': (context) => LoginScreen(),
              '/home': (context) => HomeScreen(),
              '/register': (context) => RegisterScreen(),
              '/forgot': (context) => ForgotPasswordScreen(),
            },
          );
        },
      ),
    );
  }
}
