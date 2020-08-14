import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:teste_agape/controllers/login/recuperar.control.dart';
import 'package:teste_agape/widgets/decoration.dart';
import 'package:teste_agape/widgets/textForm.dart';

class ResetPasswordPage extends StatelessWidget {
  final controller = RecuperarLoginControl();

  @override
  Widget build(BuildContext context) {
    controller.context = context;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.black38,
          onPressed: () => Navigator.pop(context, false),
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 60, left: 40, right: 40),
        color: Colors.white,
        child: ListView(
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  child: Form(
                    key: controller.formKey,
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          width: 200,
                          height: 200,
                          child: Image.asset("assets/reset-password-icon.png"),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Esqueceu sua senha?",
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Informe o endereço de email, para que seja enviado um link, contendo instruções para redefinição da senha.",
                          style: TextStyle(
                            fontSize: 14,
                          ),
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
                                validateForm: controller.validateEmail);
                          },
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 20,
                      ),
                      montarBotaoRegistro(),
                      SizedBox(
                        height: 20,
                      ),
                      montarBotaoCancelar(context),
                    ],
                  ),
                )
              ],
            )
          ],
        ),
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

  Container montarBotaoRegistro() {
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
                      "Enviar",
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
            onPressed: controller.confirmEnvio,
          );
        }),
      ),
    );
  }
}
