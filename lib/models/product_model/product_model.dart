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
  bool isFavourite = false;

  int? qty;

  ProductModel({
    required this.image,
    required this.id,
    required this.name,
    required this.price,
    required this.description,
    required isFavourite,
    this.qty,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        image: json["image"] ??
            "https://cdn-icons-png.flaticon.com/512/2748/2748441.png",
        id: json["id"] ?? "",
        name: json["name"] ?? "Product X",
        price: double.parse(json["price"].toString()),
        description: json["description"] ??
            "This is an awesome product and must to buy.",
        isFavourite: false,
        qty: json["qty"],
      );

  Map<String, dynamic> toJson() => {
        "image": image,
        "id": id,
        "name": name,
        "price": price,
        "description": description,
        "isFavourite": isFavourite,
        "qty": qty,
      };

  ProductModel copyWith({
    int? qty,
  }) =>
      ProductModel(
        image: image,
        id: id,
        name: name,
        price: price,
        description: description,
        isFavourite: isFavourite,
        qty: qty??this.qty,
      );
}
