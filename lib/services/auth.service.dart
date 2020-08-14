import 'dart:convert';
import 'package:teste_agape/models/auth.model.dart';
import 'package:teste_agape/models/authLogin.model.dart';
import 'package:teste_agape/repositories/login.repository.dart';

class AuthSevice {
  Future<Auth> authLogin(AuthLogin authLogin) async {
    var loginRepository = LoginRepository();

    var response = await loginRepository.login(authLogin);

    if (response.statusCode == 200) {
      // Sucesso
      var auth = Auth.fromMap(response.data);
      auth.statusResponse = response.statusCode;
      return auth;
    } else {
      // If that response was not OK, throw an error.
      var error = json.decode(response.data);

      if (response.statusCode == 400) {
        throw new Exception("Dados inválidos.");
      } else {
        throw Exception(
          error['Message'],
        );
      }
    }
  }

  Future<bool> recuperarLogin(String email) async {
    var loginRepository = LoginRepository();

    var response = await loginRepository.recuperar(email);

    if (response.statusCode == 200) {
      return Future.value(true);
    } else {
      if (response.statusCode == 404) {
        throw new Exception("Não encontrado registro com o email informado.");
      } else {
        throw new Exception("Não foi possível realizar a ação.");
      }
    }
  }
}
