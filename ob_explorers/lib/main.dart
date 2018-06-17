import 'package:flutter/material.dart';
import 'package:ob_explorers/pages/home.dart';
import 'package:ob_explorers/pages/intro.dart';
import 'package:ob_explorers/pages/splash.dart';

var routes = <String, WidgetBuilder>{
  "/home": (BuildContext context) => HomeScreen(),
  "/intro": (BuildContext context) => IntroScreen(),
};

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
            primaryColor: Colors.red, accentColor: Colors.deepOrange[400]),
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
        routes: routes);
  }
}
