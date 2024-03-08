import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:flutter_ecatalog/data/models/request/product_create_request_model.dart';
import 'package:flutter_ecatalog/data/models/response/product_all_response_model.dart';
import 'package:flutter_ecatalog/data/models/response/product_create_response_model.dart';
import 'package:http/http.dart' as http;

class ProductDatasource {
  Future<Either<String, List<ProductAllResponseModel>>> getAllProducts() async {
    log("GetAllProducts Berjalan");
    final response = await http.get(
      Uri.parse("https://api.escuelajs.co/api/v1/products/"),
      headers: {"Content-Type": "application/json"},
    );
    log("test :" + response.statusCode.toString());
    if (response.statusCode == 200) {
      return Right(productAllResponseModelFromJson(response.body));
    } else {
      return Left("Error getting products");
    }
  }

  Future<Either<String, ProductCreateResponseModel>> createProduct(
      ProductCreateRequestModel model) async {
    final response = await http.post(
      Uri.parse("https://api.escuelajs.co/api/v1/products/"),
      headers: {"Content-Type": "application/json"},
      body: productCreateResponseModelToJson(model),
    );
    if (response.statusCode == 201) {
      return Right(productCreateResponseModelFromJson(response.body));
    } else {
      return Left("Error creating product");
    }
  }
}
