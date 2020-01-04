import 'package:flutter/material.dart';

enum ColorType {
  RED,
  ORANGE,
  YELLOW,
  GREEN,
  BLUE,
  DUSK,
  PURPLE,
}

class Colors {
  Colors._();
  static const paleGray = Color(0xffdde2ec);
  static const mediumGray = Color(0xff869ab7);
  static const cloudyBlue = Color(0xffafc2db);
  static const red = Color.fromARGB(255, 255, 114, 141);
  static const orange = Color.fromARGB(255, 245, 166, 35);
  static const yellow = Color.fromARGB(255, 240, 192, 0);
  static const green = Color.fromARGB(255, 29, 211, 168);
  static const blue = Color.fromARGB(255, 103, 157, 255);
  static const dusk = Color.fromARGB(255, 65, 77, 107);
  static const purple = Color.fromARGB(255, 182, 105, 249);
  static const carnation = Color.fromARGB(255, 255, 114, 141);
  static Color getColor(ColorType color) {
    return color == ColorType.RED
        ? Colors.red
        : color == ColorType.ORANGE
        ? Colors.orange
        : color == ColorType.YELLOW
        ? Colors.yellow
        : color == ColorType.GREEN
        ? Colors.green
        : color == ColorType.BLUE
        ? Colors.blue
        : color == ColorType.PURPLE
        ? Colors.purple
        : Colors.dusk;
  }
}