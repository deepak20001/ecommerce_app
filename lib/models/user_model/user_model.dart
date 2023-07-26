import 'dart:convert';

UserModel userModelFromJson(String str) =>
    UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  String? image;
  String name;
  String id;
  String email;

  UserModel({
    this.image,
    required this.name,
    required this.id,
    required this.email,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        image: json["image"],
        name: json["name"],
        id: json["id"],
        email: json["email"],
      );

  Map<String, dynamic> toJson() => {
        "image": image,
        "name": name,
        "id": id,
        "email": email,
      };
}
