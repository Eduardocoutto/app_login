import 'package:dio/dio.dart';
import 'package:teste_agape/models/pagination.model.dart';
import 'package:teste_agape/models/usuario.model.dart';
import 'package:teste_agape/services/api.dart';
import 'package:teste_agape/utils/customDio.dart';

class UsuariosRepository {
  final url = apiEndPoint + '/usuario';

  Future<bool> salve(UsuarioModel userModel) async {
    var dio;

    if (userModel.idUsuario == 0)
      dio = CustomDio().instance;
    else
      dio = CustomDio.withAuthentication().instance;

    var response;

    if (userModel.idUsuario == 0) {
      response = await dio.post(url,
          data: userModel.toJson(),
          options: Options(contentType: Headers.jsonContentType));
    } else {
      response = await dio.put(url,
          data: userModel.toJson(),
          options: Options(contentType: Headers.jsonContentType));
    }

    if (response.statusCode == 200) {
      if (userModel.idUsuario == 0) {
        userModel = UsuarioModel.fromMap(response.data);
      }

      return Future.value(true);
    } else if (response.data != null && response.data['Message'] != null)
      throw new Exception(response.data['Message']);
    else
      throw new Exception("Não foi possível realizar a operação.");
  }

  Future<List<UsuarioModel>> findAll() {
    var dio = CustomDio.withAuthentication().instance;
    return dio.get(url).then((res) {
      return res.data.map<UsuarioModel>((c) => UsuarioModel.fromMap(c)).toList()
          as List<UsuarioModel>;
    }).catchError((err) => print(err));
  }

  Future<Pagination<UsuarioModel>> findFilter(String login, int page) async {
    var dio = CustomDio.withAuthentication().instance;

    final urlFilter = url +
        '/paginacao?search=' +
        (login == null ? '' : login) +
        '&limite=10&page=$page&sort=desc&tiposort=0';

    // Filtro
    var res = await dio.get(urlFilter);

    var dataResult = res.data['data']
        .map<UsuarioModel>((c) => UsuarioModel.fromMap(c))
        .toList() as List<UsuarioModel>;

    Pagination<UsuarioModel> pagination = new Pagination<UsuarioModel>(
        data: dataResult,
        totalCount: res.data["totalCount"],
        pageSize: res.data["pageSize"],
        currentPage: res.data["currentPage"],
        totalPages: res.data["totalPages"]);

    return pagination;
  }

  Future<bool> remove(int idUsuario) async {
    var dio = CustomDio.withAuthentication().instance;

    var response;

    response = await dio.delete(url + '/$idUsuario');

    if (response.statusCode == 200) {
      return Future.value(true);
    } else if (response.data != null && response.data['Message'] != null)
      throw new Exception(response.data['Message']);
    else
      throw new Exception("Não foi possível realizar a operação.");
  }
}
