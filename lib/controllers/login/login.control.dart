import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mobx/mobx.dart';
import 'package:teste_agape/business/auth.business.dart';
import 'package:teste_agape/controllers/login/user.control.dart';
import 'package:teste_agape/models/usuario.model.dart';
import 'package:teste_agape/pages/home.page.dart';
import 'package:teste_agape/repositories/usuario.repository.dart';
import 'package:teste_agape/utils/appTools.dart';
import 'package:teste_agape/widgets/dialog.dart';

part 'login.control.g.dart';

class LoginPageControl = LoginPageControlBase with _$LoginPageControl;

abstract class LoginPageControlBase with Store {
  var userControl = UserControl();
  final formKey = new GlobalKey<FormState>();
  BuildContext context;

  @observable
  bool processing = false;

  @computed
  bool get isValidLoginForm {
    return validateAndSave() &&
        validateUserLogin() == null &&
        validateSenha() == null;
  }

  bool get isValidCadastroForm {
    return validateAndSave() &&
        validateUserLogin() == null &&
        validateSenha() == null &&
        validateEmail() == null;
  }

  bool get isValidEditForm {
    return validateAndSave() &&
        validateUserLogin() == null &&
        validateEmail() == null;
  }

  @action
  bool validateAndSave() {
    final form = formKey.currentState;
    if (formKey.currentState.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  @action
  confirmLogin() async {
    try {
      if (processing) {
        return;
      }

      processing = true;
      if (validateAndSave() && isValidLoginForm) {
        bool autenticado =
            await Auth().signIn(userControl.login, userControl.senha);

        if (autenticado) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => HomePage(),
            ),
          );
        } else {
          DialogDirector.showMessageDialog(context, "",
              "Não foi possível realizar o login. Tente novamente.");
        }
      }
    } on DioError catch (erro) {
      String msgErro = "";
      if (erro.response.statusCode != null && erro.response.statusCode == 401) {
        msgErro = "Login incorreto";
      } else {
        msgErro = "Falha ao tentar realizar login";
      }
      DialogDirector.showMessageDialog(context, "Ops", msgErro);
    } catch (e) {
      DialogDirector.showMessageDialog(context, "", e.message);
    } finally {
      processing = false;
    }
  }

  @action
  confirmCadastro() async {
    try {
      if (processing) {
        return;
      }

      processing = true;
      if ((validateAndSave() && isValidCadastroForm)) {
        var usuariosRepository = UsuariosRepository();

        bool registroSalvo =
            await usuariosRepository.salve(this.userControl.getUsuarioModel());

        if (registroSalvo) {
          DialogDirector.showMessageDialogFull(
              context, "", "Cadastro realizado com sucesso!",
              onPressed: fecharDialogSucessoCadastro);
        } else {
          DialogDirector.showMessageDialog(context, "",
              "Não foi possível realizar o login. Tente novamente.");
        }
      }
      processing = false;
    } on DioError catch (erro) {
      String msgErro = "";
      if (erro.response != null &&
          erro.response.data != null &&
          erro.response.data['Message'] != null) {
        msgErro = erro.response.data['Message'];
      } else {
        msgErro = "Falha ao realizar cadastro";
      }
      DialogDirector.showMessageDialog(context, "Ops", msgErro);
    } catch (e) {
      DialogDirector.showMessageDialog(context, "", e.message);
    } finally {
      processing = false;
    }
  }

  fecharDialogSucessoCadastro() {
    Navigator.pop(context, true);
    Navigator.pop(context, true);
  }

  confirmEdit() async {
    try {
      if (processing) {
        return;
      }
      bool novoRegistro = this.userControl.idUsuario == 0;

      processing = true;
      if ((validateAndSave() && isValidEditForm)) {
        var usuariosRepository = UsuariosRepository();

        bool registroSalvo =
            await usuariosRepository.salve(this.userControl.getUsuarioModel());

        if (registroSalvo) {
          DialogDirector.showMessageDialogFull(context, "",
              "Cadastro " + (novoRegistro ? "realizado" : "atualizado") + "!",
              onPressed: fecharDialogSucessoCadastro);
        } else {
          DialogDirector.showMessageDialog(context, "",
              "Não foi possível realizar o login. Tente novamente.");
        }
      }
      processing = false;
    } on DioError catch (erro) {
      String msgErro = "";
      if (erro.response != null &&
          erro.response.data != null &&
          erro.response.data['Message'] != null) {
        msgErro = erro.response.data['Message'];
      } else {
        msgErro = "Falha ao realizar ação ";
      }
      DialogDirector.showMessageDialog(context, "Ops", msgErro);
    } catch (e) {
      DialogDirector.showMessageDialog(context, "", e.message);
    } finally {
      processing = false;
    }
  }

  String validateUserLogin() {
    if (!this.processing && userControl.login == null) {
      return null;
    }

    if (userControl.login == null || userControl.login.length == 0) {
      return "Informe o login.";
    }
    return null;
  }

  String validateSenha() {
    if (!this.processing && userControl.senha == null) {
      return null;
    }
    if (userControl.senha == null || userControl.senha.length == 0) {
      return "Informe a senha.";
    }
    return null;
  }

  String validateEmail() {
    if (!this.processing && userControl.email == null) {
      return null;
    }

    if (userControl.email == null || userControl.email.length == 0) {
      return "Informe o email";
    } else if (!AppTools.validateEmail(userControl.email)) {
      return "Email informado é inválido.";
    }
    return null;
  }

  setUsuarioModel(UsuarioModel usuarioModel) {
    this.userControl.setAdmin(usuarioModel.admin);
    this.userControl.setEmail(usuarioModel.email);
    this.userControl.setStatus(usuarioModel.status);
    this.userControl.setLogin(usuarioModel.login);
    this.userControl.setIdUsuario(usuarioModel.idUsuario);
  }
}
