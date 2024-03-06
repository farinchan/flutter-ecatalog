

import 'dart:convert';

RegisterRequestModel registerRequestModelFromJson(String str) => RegisterRequestModel.fromJson(json.decode(str));

String registerRequestModelToJson(RegisterRequestModel data) => json.encode(data.toJson());

class RegisterRequestModel {
    final String name;
    final String email;
    final String password;
    final String avatar;

    RegisterRequestModel({
        required this.name,
        required this.email,
        required this.password,
        this.avatar = "https://api.lorem.space/image/face?w=640&h=480",
    });

    factory RegisterRequestModel.fromJson(Map<String, dynamic> json) => RegisterRequestModel(
        name: json["name"],
        email: json["email"],
        password: json["password"],
        avatar: json["avatar"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "password": password,
        "avatar": avatar,
    };
}
