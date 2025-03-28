class Recipe {
  final String idMeal;
  final String strMeal;
  final String strMealThumb;
  final String? strInstructions;
  final String? strSource;
  final String? strCategory;
  final String? strArea;
  final String? strYoutube;
  final Map<String, String> ingredients;

  Recipe({
    required this.idMeal,
    required this.strMeal,
    required this.strMealThumb,
    this.strInstructions,
    this.strSource,
    this.strCategory,
    this.strArea,
    this.strYoutube,
    this.ingredients = const {},
  });

  factory Recipe.fromJson(Map<String, dynamic> json) {
    print('Parsing Recipe: ${json['idMeal']}');
    Map<String, String> ingredientsMap = {};
    for (int i = 1; i <= 20; i++) {
      String? ingredient = json['strIngredient$i'];
      String? measure = json['strMeasure$i'];
      if (ingredient != null && ingredient.isNotEmpty) {
        print('Warning: strMealThumb is null for recipe ${json['idMeal']}');
        ingredientsMap['strIngredient$i'] = '$measure $ingredient';
      }
    }

    String idMealValue =
        json['idMeal'] != null ? json['idMeal'].toString() : 'UnknownID';
    String strMealValue =
        json['strMeal'] != null ? json['strMeal'].toString() : 'UnknownMeal';
    String strMealThumbValue =
        json['strMealThumb'] != null ? json['strMealThumb'].toString() : '';
    String? strInstructionsValue =
        json['strInstructions']?.toString(); // Handle null instructions
    String? strSourceValue =
        json['strSource']?.toString(); // Handle null source
    String? strCategoryValue =
        json['strCategory']?.toString(); // Handle null category
    String? strAreaValue = json['strArea']?.toString(); // Handle null area
    String? strYoutubeValue =
        json['strYoutube']?.toString(); // Handle null Youtube

    return Recipe(
      idMeal: idMealValue,
      strMeal: strMealValue,
      strMealThumb: strMealThumbValue,
      strInstructions: strInstructionsValue,
      strSource: strSourceValue,
      strCategory: strCategoryValue,
      strArea: strAreaValue,
      strYoutube: strYoutubeValue,
      ingredients: ingredientsMap,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'idMeal': idMeal,
      'strMeal': strMeal,
      'strMealThumb': strMealThumb,
      'strInstructions': strInstructions,
      'strSource': strSource,
      'strCategory': strCategory,
      'strArea': strArea,
      'strYoutube': strYoutube,
      'ingredients': ingredients,
    };
  }
}
