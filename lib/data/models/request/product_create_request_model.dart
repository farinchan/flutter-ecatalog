// To parse this JSON data, do
//
//     final productCreateRequestModel = productCreateRequestModelFromJson(jsonString);

import 'dart:convert';

ProductCreateRequestModel productCreateRequestModelFromJson(String str) =>
    ProductCreateRequestModel.fromJson(json.decode(str));

String productCreateRequestModelToJson(ProductCreateRequestModel data) =>
    json.encode(data.toJson());

class ProductCreateRequestModel {
  final String title;
  final int price;
  final String description;
  final int categoryId;
  final List<String> images;

  ProductCreateRequestModel({
    required this.title,
    required this.price,
    required this.description,
    this.categoryId = 1,
    this.images = const ["https://placeimg.com/640/480/any"],
  });

  factory ProductCreateRequestModel.fromJson(Map<String, dynamic> json) =>
      ProductCreateRequestModel(
        title: json["title"],
        price: json["price"],
        description: json["description"],
        categoryId: json["categoryId"],
        images: List<String>.from(json["images"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "price": price,
        "description": description,
        "categoryId": categoryId,
        "images": List<dynamic>.from(images.map((x) => x)),
      };
}
