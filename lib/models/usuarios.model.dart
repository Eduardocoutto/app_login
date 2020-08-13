import 'dart:async';

import 'package:teste_agape/models/pagination.model.dart';
import 'package:teste_agape/models/usuario.model.dart';
import 'package:teste_agape/repositories/usuario.repository.dart';

class UsuarioModels {
  Stream<List<UsuarioModel>> stream;
  bool hasMore;
  String login;
  int currentPage = 0;
  bool _isLoading;
  List<UsuarioModel> _data;
  StreamController<List<UsuarioModel>> _controller;

  Pagination<UsuarioModel> _pagination;

  UsuarioModels(String login) {
    login = login;
    _data = List<UsuarioModel>();
    _controller = StreamController<List<UsuarioModel>>.broadcast();
    _isLoading = false;
    stream = _controller.stream.map((List<UsuarioModel> usuarioModelsData) {
      return usuarioModelsData.map((UsuarioModel usuarioModelData) {
        return usuarioModelData;
      }).toList();
    });
    hasMore = true;

    refresh();
  }

  Future<void> refresh() {
    currentPage = 0;
    return loadMore(clearCachedData: true);
  }

  Future<void> loadMore({bool clearCachedData = false}) async {
    if (clearCachedData) {
      _data = List<UsuarioModel>();
      hasMore = true;
    }
    if (_isLoading || !hasMore) {
      return Future.value();
    }
    _isLoading = true;
    _pagination = await UsuariosRepository().findFilter(login, ++currentPage);
    _isLoading = false;
    _data.addAll(_pagination.data);
    hasMore = (_pagination.currentPage < _pagination.totalPages);
    _controller.add(_data);
  }
}
