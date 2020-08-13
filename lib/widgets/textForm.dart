import 'package:flutter/material.dart';

class TextFormFactory {
  static TextFormField montarTextForm(String label, String Function() errorText,
      Function onChanged, TextInputType textInputType,
      {String Function() validateForm, String initialValue, bool enabled}) {
    return TextFormField(
        // autofocus: true,
        enabled: enabled,
        keyboardType: textInputType,
        obscureText: textInputType == TextInputType.visiblePassword,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(
            color: Colors.black38,
            fontWeight: FontWeight.w400,
            fontSize: 20,
          ),
          errorText: errorText == null ? null : errorText(),
        ),
        style: TextStyle(fontSize: 20),
        initialValue: initialValue,
        onChanged: onChanged,
        validator: (val) => validateForm == null ? "" : validateForm());
  }
}
