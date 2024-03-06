// To parse this JSON data, do
//
//     final registerResponseModel = registerResponseModelFromJson(jsonString);

import 'dart:convert';

RegisterResponseModel registerResponseModelFromJson(String str) => RegisterResponseModel.fromJson(json.decode(str));

String registerResponseModelToJson(RegisterResponseModel data) => json.encode(data.toJson());

class RegisterResponseModel {
    final String email;
    final String password;
    final String name;
    final String avatar;
    final String role;
    final int id;
    final DateTime creationAt;
    final DateTime updatedAt;

    RegisterResponseModel({
        required this.email,
        required this.password,
        required this.name,
        required this.avatar,
        required this.role,
        required this.id,
        required this.creationAt,
        required this.updatedAt,
    });

    factory RegisterResponseModel.fromJson(Map<String, dynamic> json) => RegisterResponseModel(
        email: json["email"],
        password: json["password"],
        name: json["name"],
        avatar: json["avatar"],
        role: json["role"],
        id: json["id"],
        creationAt: DateTime.parse(json["creationAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
    );

    Map<String, dynamic> toJson() => {
        "email": email,
        "password": password,
        "name": name,
        "avatar": avatar,
        "role": role,
        "id": id,
        "creationAt": creationAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
    };
}
