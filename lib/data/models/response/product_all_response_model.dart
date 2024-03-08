// To parse this JSON data, do
//
//     final productAllResponseModel = productAllResponseModelFromJson(jsonString);

import 'dart:convert';

List<ProductAllResponseModel> productAllResponseModelFromJson(String str) => List<ProductAllResponseModel>.from(json.decode(str).map((x) => ProductAllResponseModel.fromJson(x)));

class ProductAllResponseModel {
    final int id;
    final String title;
    final int price;
    final String description;
    final List<String> images;
    final DateTime creationAt;
    final DateTime updatedAt;
    final Category category;

    ProductAllResponseModel({
        required this.id,
        required this.title,
        required this.price,
        required this.description,
        required this.images,
        required this.creationAt,
        required this.updatedAt,
        required this.category,
    });

    factory ProductAllResponseModel.fromJson(Map<String, dynamic> json) => ProductAllResponseModel(
        id: json["id"],
        title: json["title"],
        price: json["price"],
        description: json["description"],
        images: List<String>.from(json["images"].map((x) => x)),
        creationAt: DateTime.parse(json["creationAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        category: Category.fromJson(json["category"]),
    );

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

}