import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:newsflutter/common/common.dart';
import 'package:newsflutter/utils/utils.dart';

import 'home/home_screen.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isDark = false;

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor:
      isDark ? ColorPalettes.darkPrimary : ColorPalettes.lightPrimary,
      statusBarIconBrightness: isDark ? Brightness.light : Brightness.dark,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppConstant.appName,
      debugShowCheckedModeBanner: false,
      theme: isDark ? AppTheme.darkTheme : AppTheme.lightTheme,
      initialRoute: HomePage.routeName,
      routes: {
        HomePage.routeName: (context) => HomePage(title: AppConstant.appName),
      },
    );
  }
}
