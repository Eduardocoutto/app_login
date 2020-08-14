import 'package:dio/dio.dart';
import 'package:teste_agape/models/authLogin.model.dart';
import 'package:teste_agape/services/api.dart';
import 'package:teste_agape/utils/customDio.dart';

class LoginRepository {
  Future<Response> login(AuthLogin authLogin) async {
    var dio = CustomDio().instance;

    String parametros = '/token?username=' +
        authLogin.login +
        '&password=' +
        authLogin.password;

    //dio.options.contentType = "application/x-www-form-urlencoded";

    var response = await dio.get(apiEndPoint + parametros);
    return response;
  }

  Future<Response> recuperar(String email) async {
    var dio = CustomDio().instance;
    final urlConsulta = apiEndPoint + '/usuario/recuperar?email=' + email;
    var res = await dio.post(urlConsulta);
    return res;
  }
}
