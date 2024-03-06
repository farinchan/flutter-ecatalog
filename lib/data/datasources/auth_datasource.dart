import 'package:dartz/dartz.dart';
import 'package:flutter_ecatalog/data/models/response/register_response_model.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_ecatalog/data/models/request/register_request_model.dart';

class AuthDataSource {
  final String _url = "https://api.escuelajs.co/api/v1/users/";

  Future<Either<String, RegisterResponseModel>> register(RegisterRequestModel model)async {
    final response = await http.post(
      Uri.parse(_url),
      body: registerRequestModelToJson(model),
      headers: {"Content-Type": "application/json"},
    );

    if (response.statusCode == 201) {
      return Right(registerResponseModelFromJson(response.body));
    } else {
      return Left("Error registering user");
    }
  }
}
