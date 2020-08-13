import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:teste_agape/business/appPreferences.dart';

class CustomDio {
  var _dio;

  CustomDio() {
    _dio = Dio();
  }

  CustomDio.withAuthentication() {
    _dio = Dio();

    var headers = {
      "Accept": "application/json",
      "Content-Type": "application/json"
    };

    _dio.options.contentType = "application/json";
    _dio.options.headers = headers;

    _dio.interceptors.add(InterceptorsWrapper(
        onRequest: _onRequest, onResponse: _onRespose, onError: _onError));
  }

  Dio get instance => _dio;

  _onRequest(RequestOptions options) async {
    AppPreferences appPreferences = await AppPreferences.getPreferences();
    options.headers['Authorization'] = "Bearer " + appPreferences.lastToken;
  }

  _onError(DioError e) {
    return e;
  }

  _onRespose(Response e) {
    // print('########### Response Log');
    // print(e.data);
    // print('########### Response Log');
  }
}
