import 'dart:convert';

CategoryModel categoryModelFromJson(String str) =>
    CategoryModel.fromJson(json.decode(str));

String categoryModelToJson(CategoryModel data) => json.encode(data.toJson());

class CategoryModel {
  String image;
  String name;
  String id;

  CategoryModel({
    required this.image,
    required this.name,
    required this.id,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
        image: json["image"],
        name: json["name"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "image": image,
        "name": name,
        "id": id,
      };
}
