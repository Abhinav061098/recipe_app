class Category {
  final String name;
  final String imageUrl;
  final String? recipeId;

  Category({required this.name, required this.imageUrl, this.recipeId});

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      name: json['strCategory'],
      imageUrl: json['strCategoryThumb'],
      recipeId:
          json['idMeal'], // Assuming 'idMeal' is present if you are using it.
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'strCategory': name,
      'strCategoryThumb': imageUrl,
      'idMeal': recipeId,
    };
  }
}
