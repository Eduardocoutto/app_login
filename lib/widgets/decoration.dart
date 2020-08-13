import 'package:flutter/material.dart';

class DecorationApp {
  static BoxDecoration getBoxDecorationButton() {
    return BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        stops: [0.3, 1],
        colors: [
          Color.fromRGBO(0, 170, 255, 1),
          Color.fromRGBO(136, 0, 255, 1),
        ],
      ),
      borderRadius: BorderRadius.all(
        Radius.circular(5),
      ),
    );
  }
}
