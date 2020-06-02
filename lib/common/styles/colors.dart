import 'dart:ui';

import 'package:flutter/material.dart';

class ColorPalettes{
  // Colors for light Theme
  static Color lightPrimary = Color(0xfff2f3f7);
  static Color lightAccent = Colors.redAccent;
  static Color lightBackground = Color(0xfff2f3f7);
  static Color lightTextPrimary = Color(0xff0a0a0c);
  static Color lightTextSecondary = Color(0xffaeaeb3);

  // Colors for dark Theme
  static Color darkPrimary = Color(0xff212121);
  static Color darkAccent = Color(0xffCE281C);
  static Color darkBackground = Color(0xff212121);
  static Color darkTextPrimary = Color(0xffffffff);
  static Color darkTextSecondary = Color(0xffaeaeb3);

  static Color white = Color(0xffffffff);
  static Color grey = Colors.grey;
  static Color red = Color(0xffCE281C);
  static Color yellow = Colors.yellow;
  static Color green = Colors.green;

  static ColorFilter grayscaleFilter = ColorFilter.mode(
    Colors.grey,
    BlendMode.saturation,
  );
}