import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:uuid/uuid.dart';

part 'app_database.g.dart';

// Cuisines Table
class Cuisines extends Table {
  TextColumn get id => text()();
  TextColumn get name => text()();
  TextColumn get imageUrl => text().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}

// Cuisine Recipes Table (Updated to include only necessary fields)
class CuisineRecipes extends Table {
  TextColumn get idMeal => text()();
  TextColumn get strMeal => text()();
  TextColumn get strMealThumb => text()();

  @override
  Set<Column> get primaryKey => {idMeal};
}

// Favorite Recipes Table
class FavoriteRecipes extends Table {
  TextColumn get idMeal => text()();
  TextColumn get strMeal => text()();
  TextColumn get strMealThumb => text().nullable()();
  TextColumn get strInstructions => text().nullable()();
  TextColumn get strSource => text().nullable()();
  TextColumn get strCategory => text().nullable()();
  TextColumn get strArea => text().nullable()();
  TextColumn get strYoutube => text().nullable()();
  TextColumn get ingredientsJson => text().nullable()();

  @override
  Set<Column> get primaryKey => {idMeal};
}

// Cached Recipes Table
class CachedRecipes extends Table {
  TextColumn get idMeal => text()();
  TextColumn get strMeal => text()();
  TextColumn get strMealThumb => text().nullable()();
  TextColumn get strInstructions => text().nullable()();
  TextColumn get strSource => text().nullable()();
  TextColumn get strCategory => text().nullable()();
  TextColumn get strArea => text().nullable()();
  TextColumn get strYoutube => text().nullable()();
  TextColumn get ingredientsJson => text().nullable()();
  IntColumn get viewedAt => integer().nullable()();

  @override
  Set<Column> get primaryKey => {idMeal};
}

// Widget Categories Table
class WidgetCategories extends Table {
  TextColumn get name => text()();
  TextColumn get imageUrl => text()();
  TextColumn get recipeId => text()();

  @override
  Set<Column> get primaryKey => {name};
}

// Screen Categories Table
class ScreenCategories extends Table {
  TextColumn get idCategory => text()();
  TextColumn get strCategory => text()();
  TextColumn get strCategoryThumb => text()();
  TextColumn get strCategoryDescription => text()();

  @override
  Set<Column> get primaryKey => {idCategory};
}

// Drift Database Class
@DriftDatabase(
  tables: [
    FavoriteRecipes,
    CachedRecipes,
    WidgetCategories,
    ScreenCategories,
    Cuisines,
    CuisineRecipes, // ✅ Added CuisineRecipes Table
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection()) {
    _checkTables();
  }

  @override
  int get schemaVersion => 4; // ✅ Updated Schema Version

  @override
  MigrationStrategy get migration => MigrationStrategy(
        onCreate: (m) async {
          await m.createAll(); // Create all tables if it's a fresh database
        },
        onUpgrade: (m, from, to) async {
          if (from < 4) {
            await m.createTable(cuisineRecipes); // ✅ Migrate to new version
          }
        },
        beforeOpen: (details) async {
          if (details.wasCreated) {
            print('✅ New Database Created!');
          } else {
            print(
              '🔄 Database Updated from ${details.versionBefore} to $schemaVersion',
            );
          }
        },
      );

  // --- CUISINE RECIPES ---
  // Future<List<CuisineRecipe>> getAllCuisineRecipes() =>
  //     select(cuisineRecipes).get();

  Future<void> insertCuisineRecipe(CuisineRecipesCompanion entry) async {
    await into(cuisineRecipes).insert(entry);
  }

  Future<void> deleteAllCuisineRecipes() async {
    await delete(cuisineRecipes).go();
  }

  Future<List<CachedRecipe>> getRecipesByCuisine(String cuisine) async {
    // Added async
    print('Fetching recipes for cuisine: $cuisine');
    final query = (select(cachedRecipes)
      ..where((tbl) => tbl.strArea.lower().equals(cuisine.toLowerCase())));
    return await query.get(); // Added await
  }

  Future<void> insertRecipe(CachedRecipe recipe) async {
    await into(cachedRecipes).insert(recipe, mode: InsertMode.insertOrReplace);
  }

  // --- CUISINES ---
  Future<List<Cuisine>> getAllCuisines() => select(cuisines).get();

  Future<void> insertCuisine(CuisinesCompanion entry) async {
    await into(cuisines).insert(entry);
  }

  Future<void> addCuisine(String cuisineName) async {
    await insertCuisine(
      CuisinesCompanion.insert(id: const Uuid().v4(), name: cuisineName),
    );
  }

  Future<void> deleteAllCuisines() async {
    await delete(cuisines).go();
  }

  // --- FAVORITE RECIPES ---
  Future<List<FavoriteRecipe>> getFavoriteRecipes() =>
      select(favoriteRecipes).get();

  Stream<List<FavoriteRecipe>> watchFavoriteRecipes() =>
      select(favoriteRecipes).watch();

  Future<void> insertFavoriteRecipe(FavoriteRecipesCompanion entry) =>
      into(favoriteRecipes).insert(entry);

  Future<void> deleteFavoriteRecipe(String idMeal) =>
      (delete(favoriteRecipes)..where((tbl) => tbl.idMeal.equals(idMeal))).go();

  Future<bool> isRecipeFavorite(String idMeal) async {
    final results = await (select(favoriteRecipes)
          ..where((tbl) => tbl.idMeal.equals(idMeal)))
        .get();
    return results.isNotEmpty;
  }

  // --- CACHED RECIPES ---
  Future<List<CachedRecipe>> getAllCachedRecipes() =>
      select(cachedRecipes).get();

  Future<CachedRecipe?> getCachedRecipeById(String idMeal) =>
      (select(cachedRecipes)..where((tbl) => tbl.idMeal.equals(idMeal)))
          .getSingleOrNull();

  Future<void> insertCachedRecipe(CachedRecipesCompanion entry) =>
      into(cachedRecipes).insert(entry);

  Future<void> deleteCachedRecipe(String idMeal) =>
      (delete(cachedRecipes)..where((tbl) => tbl.idMeal.equals(idMeal))).go();

  // --- WIDGET CATEGORIES ---
  Future<List<WidgetCategory>> getAllWidgetCategories() =>
      select(widgetCategories).get();

  Future<void> insertWidgetCategory(WidgetCategoriesCompanion entry) async {
    await into(widgetCategories).insert(entry, mode: InsertMode.insertOrIgnore);
  }

  // --- SCREEN CATEGORIES ---
  Future<List<ScreenCategory>> getAllScreenCategories() =>
      select(screenCategories).get();

  Future<void> insertScreenCategory(ScreenCategoriesCompanion entry) async {
    await into(screenCategories).insert(entry, mode: InsertMode.insertOrIgnore);
  }

  /// Check if Tables Exist in the Database
  Future<void> _checkTables() async {
    try {
      final widgetCategoriesTable =
          await customSelect('PRAGMA table_info(widget_categories);').get();
      final screenCategoriesTable =
          await customSelect('PRAGMA table_info(screen_categories);').get();

      if (widgetCategoriesTable.isEmpty) {
        print('❌ Table `widget_categories` does NOT exist.');
      } else {
        print('✅ Table `widget_categories` exists!');
      }

      if (screenCategoriesTable.isEmpty) {
        print('❌ Table `screen_categories` does NOT exist.');
      } else {
        print('✅ Table `screen_categories` exists!');
      }
    } catch (e) {
      print('🚨 Error checking tables: $e');
    }
  }
}

/// Database Connection
LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return NativeDatabase.createInBackground(file);
  });
}
