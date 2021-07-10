import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dash/core/constants/url_constants.dart';
import 'package:dash/data/models/company_model.dart';
import 'package:get_storage/get_storage.dart';
import '../../core/errors/failure.dart';
import '../models/models.dart';
import 'package:http/http.dart' as http;

class Repository {
  Future<Either<Failure, TokenAccessModel>> login(
      String username, String password) async {
    try {
      final data = {'username': username, 'password': password};

      final response = await http.post(
        Uri.parse(UrlConst.loginEnpoint),
        headers: {'Content-Type': 'application/json'},
        body: json.encode(data),
      );
      if (response.statusCode == 200) {
        final token = TokenAccessModel(
          tokenAccess: json.decode(response.body)['access_token'],
          username: username,
        );
        await GetStorage().write('token', token.toMap());
        return Right(token);
      }
      return Left(LoginError(message: "Error ao tentar logar!"));
    } catch (e) {
      return Left(LoginError(message: "Error ao tentar logar!"));
    }
  }

  Future<Either<Failure, List<CompanyModel>>> getCompanies(String token) async {
    try {
      final response = await http.get(Uri.parse(UrlConst.companiesEndpoint),
          headers: {"Authorization": "JWT $token"});
      if (response.statusCode == 200) {
        final body = json.decode(response.body);
        final list = body['companies'] as List;
        final companies = list.map((e) => CompanyModel.fromMap(e)).toList();
        return Right(companies);
      }
      if (response.statusCode == 401) {
        return Left(UnauthorizedError(message: 'Seu acesso se expirou!'));
      }
      return Left(
          ServerError(message: "Error ao tentar recuperar as companias!"));
    } catch (e) {
      return Left(
          ServerError(message: "Error ao tentar recuperar as companias!"));
    }
  }

  Future<void> logout() async {
    await GetStorage().remove('token');
  }
}
