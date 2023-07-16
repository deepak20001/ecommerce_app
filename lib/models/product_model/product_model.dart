import 'dart:convert';

ProductModel productModelFromJson(String str) =>
    ProductModel.fromJson(json.decode(str));

String productModelToJson(ProductModel data) => json.encode(data.toJson());

class ProductModel {
  String image;
  String id;
  String name;
  double price;
  String description;
  String status;
  bool isFavourite = false;

  ProductModel({
    required this.image,
    required this.id,
    required this.name,
    required this.price,
    required this.description,
    required this.status,
    required isFavourite,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        image: json["image"] ??
            "https://cdn-icons-png.flaticon.com/512/2748/2748441.png",
        id: json["id"] ?? "",
        name: json["name"] ?? "Product X",
        price: double.parse(json["price"].toString()),
        description: json["description"] ??
            "This is an awesome product and must to buy.",
        status: json["status"] ?? "pending",
        isFavourite: false,
      );

  Map<String, dynamic> toJson() => {
        "image": image,
        "id": id,
        "name": name,
        "price": price,
        "description": description,
        "status": status,
        "isFavourite": isFavourite,
      };
}
