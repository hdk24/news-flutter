import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:newsflutter/ui/main.dart';

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

  static Color shimmerColor = isDark? Color(0xff4d4e4f) : Color(0xffd2d3d4);
  static Color shimmerGradient = isDark? Color(0xff6d6d6e) : Color(0xffe6e7e8);

  static ColorFilter grayscaleFilter = ColorFilter.mode(
    Colors.grey,
    BlendMode.saturation,
  );
}