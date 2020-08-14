import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mobx/mobx.dart';
import 'package:teste_agape/controllers/login/user.control.dart';
import 'package:teste_agape/models/usuario.model.dart';
import 'package:teste_agape/services/auth.service.dart';
import 'package:teste_agape/utils/appTools.dart';
import 'package:teste_agape/widgets/dialog.dart';

part 'recuperar.control.g.dart';

class RecuperarLoginControl = RecuperarLoginControlBase
    with _$RecuperarLoginControl;

abstract class RecuperarLoginControlBase with Store {
  var userControl = UserControl();
  final formKey = new GlobalKey<FormState>();
  BuildContext context;

  @observable
  bool processing = false;

  @computed
  bool get isValidForm {
    return validateAndSave() && validateEmail() == null;
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
  confirmEnvio() async {
    try {
      if (processing) {
        return;
      }

      processing = true;
      if ((validateAndSave() && isValidForm)) {
        var authSevice = AuthSevice();

        bool emailEnviado =
            await authSevice.recuperarLogin(this.userControl.email);

        if (emailEnviado) {
          DialogDirector.showMessageDialogFull(
              context, "", "Email enviado com sucesso!",
              onPressed: fecharDialogSucessoCadastro);
        } else {
          DialogDirector.showMessageDialog(
              context, "", "Não foi possível enviar o email. Tente novamente.");
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
        msgErro = "Falha!";
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
