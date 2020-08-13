import 'package:dio/dio.dart';
import 'package:teste_agape/models/authLogin.model.dart';
import 'package:teste_agape/services/api.dart';
import 'package:teste_agape/utils/customDio.dart';

class LoginRepository {
  Future<Response> login(AuthLogin authLogin) async {
    var dio = CustomDio().instance;

    dio.options.contentType = "application/x-www-form-urlencoded";

    var response = await dio.post(apiEndPointAuth, data: {
      'username': authLogin.login,
      'password': authLogin.password,
      'grant_type': 'password'
    });
    return response;
  }
}
