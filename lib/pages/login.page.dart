import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:teste_agape/controllers/login/login.control.dart';
import 'package:teste_agape/pages/resetPassword.page.dart';
import 'package:teste_agape/pages/cadastro.page.dart';
import 'package:flutter/material.dart';
import 'package:teste_agape/widgets/decoration.dart';
import 'package:teste_agape/widgets/textForm.dart';

enum AuthStatus {
  notSignedIn,
  signedIn,
}

enum FormInputType {
  email,
  password,
}

class LoginPage extends StatelessWidget {
  final controller = LoginPageControl();

  @override
  Widget build(BuildContext context) {
    controller.context = context;
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 60, left: 40, right: 40),
        color: Colors.white,
        child: Form(
          key: controller.formKey,
          child: ListView(
            children: <Widget>[
              montaLogoUsuario(),
              SizedBox(
                height: 20,
              ),
              montaCampoLogin(),
              SizedBox(
                height: 10,
              ),
              montaCampoSenha(),
              motaBotaoRecuperarSenha(context),
              SizedBox(
                height: 40,
              ),
              montarBotaoLogin(context),
              SizedBox(
                height: 10,
              ),
              montaBotaoCadastro(context),
            ],
          ),
        ),
      ),
    );
  }

  Container montaBotaoCadastro(BuildContext context) {
    return Container(
      height: 40,
      child: FlatButton(
        child: Text(
          "Cadastre-se",
          textAlign: TextAlign.center,
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CadastroPage(),
            ),
          );
        },
      ),
    );
  }

  Container montarBotaoLogin(BuildContext context) {
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
                      "Login",
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
            onPressed: controller.confirmLogin,
          );
        }),
      ),
    );
  }

  SizedBox montaLogoUsuario() {
    return SizedBox(
      width: 128,
      height: 128,
      child: Image.asset("assets/user.png"),
    );
  }

  Widget montaCampoLogin() {
    return Observer(
      builder: (_) {
        return TextFormFactory.montarTextForm(
            "Login",
            controller.validateUserLogin,
            controller.userControl.setLogin,
            TextInputType.text,
            validateForm: controller.validateUserLogin);
      },
    );
  }

  Widget montaCampoSenha() {
    return Observer(
      builder: (_) {
        return TextFormFactory.montarTextForm(
          "Senha",
          controller.validateSenha,
          controller.userControl.setSenha,
          TextInputType.visiblePassword,
          validateForm: controller.validateSenha,
        );
      },
    );
  }

  Container motaBotaoRecuperarSenha(BuildContext context) {
    return Container(
      height: 40,
      alignment: Alignment.centerRight,
      child: FlatButton(
        child: Text(
          "Recuperar Senha",
          textAlign: TextAlign.right,
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ResetPasswordPage(),
            ),
          );
        },
      ),
    );
  }
}
