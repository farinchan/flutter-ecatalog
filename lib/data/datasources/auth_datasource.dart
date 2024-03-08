import 'package:dartz/dartz.dart';
import 'package:flutter_ecatalog/data/models/request/login_request_model.dart';
import 'package:flutter_ecatalog/data/models/response/login_response_model.dart';
import 'package:flutter_ecatalog/data/models/response/register_response_model.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_ecatalog/data/models/request/register_request_model.dart';

class AuthDataSource {
  final String _url = "https://api.escuelajs.co/api/v1/";

  Future<Either<String, RegisterResponseModel>> register(RegisterRequestModel model)async {
    final response = await http.post(
      Uri.parse("${_url}users/"),
      body: registerRequestModelToJson(model),
      headers: {"Content-Type": "application/json"},
    );

    if (response.statusCode == 201) {
      return Right(registerResponseModelFromJson(response.body));
    } else {
      return Left("Error registering user");
    }
  }

  Future<Either<String, LoginResponseModel>> login(LoginRequestModel model)async {
    final response = await http.post(
      Uri.parse("${_url}auth/login/"),
      body: loginRequestModelToJson(model),
      headers: {"Content-Type": "application/json"},
    );

    if (response.statusCode == 201) {
      return Right(loginResponseModelFromJson(response.body));
    } else {
      return Left("Error registering user");
    }
  }
}
