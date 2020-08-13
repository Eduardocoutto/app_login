import 'package:flutter/material.dart';

class DialogDirector {
  static showMessageDialog(BuildContext context, String title, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: new Text(title),
          content: Text(message),
          actions: <Widget>[
            new FlatButton(
              child: new Text(
                "OK",
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  static showMessageDialogFull(
      BuildContext context, String title, String message,
      {Function onPressed, bool botaoCancel}) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: new Text(title),
          content: Text(message),
          actions: <Widget>[
            new FlatButton(
              child: new Text(
                "OK",
              ),
              onPressed: onPressed == null ? defaultOnPressed : onPressed,
            ),
            if (botaoCancel != null && botaoCancel)
              new FlatButton(
                child: new Text(
                  "Cancelar",
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              )
          ],
        );
      },
    );
  }

  static showMessageDialogConfirm(
      BuildContext context, String title, String message) async {
    return await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: new Text(title),
          content: Text(message),
          actions: <Widget>[
            new FlatButton(
              child: new Text(
                "Confirmar",
                style: TextStyle(color: Colors.red),
              ),
              onPressed: () {
                Navigator.pop(context, true);
              },
            ),
            FlatButton(
              child: new Text(
                "Cancelar",
                style:
                    TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
              ),
              onPressed: () {
                Navigator.pop(context, false);
              },
            )
          ],
        );
      },
    );
  }

  static void defaultOnPressed(BuildContext context) => Navigator.pop(context);
}
