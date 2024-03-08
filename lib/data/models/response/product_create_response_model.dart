// To parse this JSON data, do
//
//     final productCreateResponseModel = productCreateResponseModelFromJson(jsonString);

import 'dart:convert';

import 'package:flutter_ecatalog/data/models/request/product_create_request_model.dart';

ProductCreateResponseModel productCreateResponseModelFromJson(String str) => ProductCreateResponseModel.fromJson(json.decode(str));

String productCreateResponseModelToJson(ProductCreateRequestModel data) => json.encode(data.toJson());

class ProductCreateResponseModel {
    final String title;
    final int price;
    final String description;
    final List<String> images;
    final Category category;
    final int id;
    final DateTime creationAt;
    final DateTime updatedAt;

    ProductCreateResponseModel({
        required this.title,
        required this.price,
        required this.description,
        required this.images,
        required this.category,
        required this.id,
        required this.creationAt,
        required this.updatedAt,
    });

    factory ProductCreateResponseModel.fromJson(Map<String, dynamic> json) => ProductCreateResponseModel(
        title: json["title"],
        price: json["price"],
        description: json["description"],
        images: List<String>.from(json["images"].map((x) => x)),
        category: Category.fromJson(json["category"]),
        id: json["id"],
        creationAt: DateTime.parse(json["creationAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
    );

    Map<String, dynamic> toJson() => {
        "title": title,
        "price": price,
        "description": description,
        "images": List<dynamic>.from(images.map((x) => x)),
        "category": category.toJson(),
        "id": id,
        "creationAt": creationAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
    };
}

class Category {
    final int id;
    final String name;
    final String image;
    final DateTime creationAt;
    final DateTime updatedAt;

    Category({
        required this.id,
        required this.name,
        required this.image,
        required this.creationAt,
        required this.updatedAt,
    });

    factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        name: json["name"],
        image: json["image"],
        creationAt: DateTime.parse(json["creationAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
        "creationAt": creationAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
    };
}
