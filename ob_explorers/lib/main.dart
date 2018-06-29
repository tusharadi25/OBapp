import 'package:flutter/material.dart';
import 'package:ob_explorers/pages/home.dart';
import 'package:ob_explorers/pages/login.dart';
import 'package:ob_explorers/pages/splash.dart';
import 'package:ob_explorers/pages/start.dart';
import 'package:ob_explorers/pages/signup.dart';
import 'package:ob_explorers/pages/about.dart';
import 'package:ob_explorers/pages/Gcreate.dart';
import 'package:ob_explorers/pages/developers.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

var routes = <String, WidgetBuilder>{
  "/home": (BuildContext context) => HomeScreen(),
  "/login": (BuildContext context) => LoginScreen(),
  "/start": (BuildContext context) => StartScreen(),
  "/signup": (BuildContext context) => SignUpScreen(),
  "/about": (BuildContext context) => AboutScreen(),
  "/dev": (BuildContext context) => DevScreen(),
  "/gc": (BuildContext context) => SignUp(),
};

void main() => runApp(new MyApp());

class MyApp extends StatefulWidget {
  @override
  AppState createState() => new AppState();
}

class AppState extends State<MyApp>{
  final FirebaseMessaging _firebaseMessaging = new FirebaseMessaging();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _firebaseMessaging.requestNotificationPermissions();

    _firebaseMessaging.configure(
      onMessage: (Map<String,dynamic> message){
      },
      onResume: (Map<String,dynamic> message){
      },
      onLaunch: (Map<String,dynamic> message){
      },
    );
    _firebaseMessaging.getToken().then((token){
      print(token);
    });
  }

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