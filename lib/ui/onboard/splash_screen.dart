import 'dart:async';

import 'package:flutter/material.dart';
import 'package:newsflutter/common/common.dart';
import 'package:newsflutter/ui/home/home_screen.dart';
import 'package:newsflutter/ui/main.dart';
import 'package:newsflutter/utils/utils.dart';

class SplashScreen extends StatefulWidget {
  static const routeName = '/';

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  startTime() async {
    var _duration = new Duration(seconds: 2);
    return new Timer(_duration, navigationPage);
  }

  void navigationPage() {
    Navigation.intentReplaceWithData(
      context,
      HomeScreen.routeName,
      ScreenArguments(AppConfig.appName),
    );
  }

  @override
  void initState() {
    super.initState();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return _splashView;
  }

  final _splashView = Scaffold(
    body: Stack(
      fit: StackFit.expand,
      children: <Widget>[
        Container(
          color: isDark
              ? ColorPalettes.darkBackground
              : ColorPalettes.lightBackground,
        ),
        Center(
          child: Text(AppConfig.appName,
              style: TextStyle(
                  fontSize: 24.0,
                  fontFamily: 'Raleway',
                  fontWeight: FontWeight.bold,
                  color: ColorPalettes.red)),
        ),
      ],
    ),
  );
}
