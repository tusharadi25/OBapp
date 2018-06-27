import 'package:flutter/material.dart';
import 'package:ob_explorers/pages/home.dart';
import 'package:ob_explorers/pages/login.dart';
import 'package:ob_explorers/pages/splash.dart';
import 'package:ob_explorers/pages/start.dart';
import 'package:ob_explorers/pages/signup.dart';

var routes = <String, WidgetBuilder>{
  "/home": (BuildContext context) => HomeScreen(),
  "/login": (BuildContext context) => LoginScreen(),
  "/start": (BuildContext context) => StartScreen(),
  "/signup": (BuildContext context) => SignUpScreen(),
};

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
            primaryColor: Colors.deepOrangeAccent,
            accentColor: Colors.white,
            fontFamily: 'Roboto-Regular'),
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
        routes: routes);
  }
}
