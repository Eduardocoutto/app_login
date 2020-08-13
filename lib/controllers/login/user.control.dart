import 'package:mobx/mobx.dart';
import 'package:teste_agape/models/usuario.model.dart';

part 'user.control.g.dart';

class UserControl = UserControlBase with _$UserControl;

abstract class UserControlBase with Store {
  @observable
  int idUsuario = 0;
  @action
  setIdUsuario(int value) => idUsuario = value;

  @observable
  String login;
  @action
  setLogin(String value) => login = value.trim();

  @observable
  String email;
  @action
  setEmail(String value) => email = value.trim();

  @observable
  String senha;
  @action
  setSenha(String value) => senha = value.trim();

  @observable
  bool status = false;
  @action
  setStatus(bool value) => status = value;

  @observable
  bool admin = false;
  @action
  setAdmin(bool value) => admin = value;

  UsuarioModel getUsuarioModel() {
    return UsuarioModel(
        idUsuario: idUsuario,
        email: email,
        login: login,
        senha: senha,
        status: status,
        admin: admin);
  }
}
