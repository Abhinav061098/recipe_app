// class Cuisine {
//   final String id;
//   final String name;
//   final String? imageUrl;

//   Cuisine({required this.id, required this.name, this.imageUrl});

//   factory Cuisine.fromJson(Map<String, dynamic> json) {
//     return Cuisine(
//       id: json['id'] as String,
//       name: json['name'] as String,
//       imageUrl: json['imageUrl'] as String?,
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'id': id,
//       'name': name,
//       'imageUrl': imageUrl,
//     };
//   }
// }
