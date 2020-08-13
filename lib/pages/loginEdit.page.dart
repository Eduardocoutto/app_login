import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:teste_agape/controllers/login/login.control.dart';
import 'package:teste_agape/models/usuario.model.dart';
import 'package:teste_agape/utils/appConstantes.dart';
import 'package:teste_agape/widgets/decoration.dart';
import 'package:teste_agape/widgets/textForm.dart';

class LoginEditPage extends StatelessWidget {
  final controller = LoginPageControl();

  LoginEditPage({UsuarioModel usuarioModel}) {
    if (usuarioModel != null) controller.setUsuarioModel(usuarioModel);
  }

  @override
  Widget build(BuildContext context) {
    controller.context = context;
    return Scaffold(
      appBar: AppBar(title: Text(appName + '')),
      body: Container(
        padding: EdgeInsets.only(top: 10, left: 40, right: 40),
        color: Colors.white,
        child: Form(
            key: controller.formKey,
            child: ListView(
              children: <Widget>[
                montarImagemCadastro(),
                SizedBox(
                  height: 20,
                ),
                Observer(
                  builder: (_) {
                    return TextFormFactory.montarTextForm(
                        "Login",
                        controller.validateUserLogin,
                        controller.userControl.setLogin,
                        TextInputType.text,
                        validateForm: controller.validateUserLogin,
                        initialValue: controller.userControl.login);
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                Observer(
                  builder: (_) {
                    return TextFormFactory.montarTextForm(
                        "Email",
                        controller.validateEmail,
                        controller.userControl.setEmail,
                        TextInputType.emailAddress,
                        validateForm: controller.validateEmail,
                        initialValue: controller.userControl.email);
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                (controller.userControl.idUsuario == 0
                    ? Observer(
                        builder: (_) {
                          return TextFormFactory.montarTextForm(
                              "Senha",
                              (controller.validateSenha),
                              controller.userControl.setSenha,
                              TextInputType.visiblePassword,
                              validateForm: controller.validateSenha);
                        },
                      )
                    : SizedBox(
                        height: 10,
                      )),
                Observer(
                  builder: (_) {
                    return CheckboxListTile(
                      title: Text("Status"),
                      secondary: const Icon(Icons.assistant_photo,
                          color: Colors.black),
                      value: controller.userControl.status,
                      onChanged: (value) =>
                          !controller.userControl.setStatus(value),
                      activeColor: Colors.black,
                    );
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                Observer(
                  builder: (_) {
                    return CheckboxListTile(
                      title: Text("Admin"),
                      secondary:
                          const Icon(Icons.security, color: Colors.black),
                      value: controller.userControl.admin,
                      onChanged: (value) =>
                          !controller.userControl.setAdmin(value),
                      activeColor: Colors.black,
                    );
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                montarBotaoSalvar(),
                SizedBox(
                  height: 10,
                ),
                montarBotaoCancelar(context),
              ],
            )),
      ),
    );
  }

  Container montarBotaoCancelar(BuildContext context) {
    return Container(
      height: 40,
      alignment: Alignment.center,
      child: FlatButton(
        child: Text(
          "Cancelar",
          textAlign: TextAlign.center,
        ),
        onPressed: () => Navigator.pop(context, false),
      ),
    );
  }

  Container montarBotaoSalvar() {
    return Container(
      height: 60,
      alignment: Alignment.centerLeft,
      decoration: DecorationApp.getBoxDecorationButton(),
      child: SizedBox.expand(
        child: Observer(builder: (_) {
          return FlatButton(
            child: Observer(builder: (_) {
              if (controller.processing) {
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    SizedBox(
                        width: 15,
                        height: 15,
                        child: CircularProgressIndicator(
                            backgroundColor: Colors.white)),
                    Text("  Aguarde",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 20,
                        ))
                  ],
                );
              } else {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Salvar",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 20,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                );
              }
            }),
            onPressed: controller.confirmEdit,
          );
        }),
      ),
    );
  }

  Container montarImagemCadastro() {
    return Container(
      width: 200,
      height: 200,
      alignment: Alignment(0.0, 1.15),
      decoration: new BoxDecoration(
        image: new DecorationImage(
          image: AssetImage("assets/user.png"),
          fit: BoxFit.fitHeight,
        ),
      ),
      child: Container(
        height: 56,
        width: 56,
        alignment: Alignment.center,
        decoration: DecorationApp.getBoxDecorationButton(),
        child: SizedBox.expand(
          child: FlatButton(
            child: Icon(
              Icons.add,
              color: Colors.white,
            ),
            onPressed: () {
              controller.confirmEdit();
            },
          ),
        ),
      ),
    );
  }
}
