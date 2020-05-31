import 'package:flutter/material.dart';
import 'package:newsflutter/common/styles/styles.dart';
import 'package:newsflutter/ui/main.dart';

class AppTheme {

  static ThemeData lightTheme = ThemeData(
    fontFamily: 'Raleway',
    backgroundColor: ColorPalettes.lightBackground,
    primaryColor: ColorPalettes.lightPrimary,
    accentColor: ColorPalettes.lightAccent,
    cursorColor: ColorPalettes.lightAccent,
    dividerColor: ColorPalettes.darkBackground,
    scaffoldBackgroundColor: ColorPalettes.lightBackground,
    appBarTheme: AppBarTheme(
      textTheme: TextTheme(
        headline: TextStyle(
          color: ColorPalettes.darkBackground,
          fontSize: 18.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    fontFamily: 'Raleway',
    brightness: Brightness.dark,
    backgroundColor: ColorPalettes.darkBackground,
    primaryColor: ColorPalettes.darkPrimary,
    accentColor: ColorPalettes.darkAccent,
    dividerColor: ColorPalettes.lightPrimary,
    scaffoldBackgroundColor: ColorPalettes.darkBackground,
    cursorColor: ColorPalettes.darkAccent,
    appBarTheme: AppBarTheme(
      color: ColorPalettes.darkPrimary,
      textTheme: TextTheme(
        headline: TextStyle(
          color: ColorPalettes.lightBackground,
          fontSize: 18.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  );

  static TextStyle titleBarStyle = TextStyle(
    color: isDark? ColorPalettes.darkTextPrimary : ColorPalettes.lightTextPrimary,
    fontSize: 18.0,
    fontWeight: FontWeight.bold,
  );
}