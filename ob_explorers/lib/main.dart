import 'package:flutter/material.dart';
import 'package:ob_explorers/pages/home.dart';
import 'package:ob_explorers/pages/login.dart';
import 'package:ob_explorers/pages/splash.dart';
import 'package:ob_explorers/pages/start.dart';
import 'package:ob_explorers/utils/ob.dart';
import 'package:ob_explorers/pages/signup.dart';
import 'package:ob_explorers/pages/about.dart';
import 'package:ob_explorers/pages/Gcreate.dart';
import 'package:ob_explorers/pages/developers.dart';
import 'package:ob_explorers/pages/contact.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:ob_explorers/pages/error.dart';
import 'package:ob_explorers/pages/success.dart';
import 'package:ob_explorers/pages/notification.dart';
import 'package:ob_explorers/pages/locations.dart';

var routes = <String, WidgetBuilder>{
  "/home": (BuildContext context) => HomeScreen(),
  "/login": (BuildContext context) => LoginScreen(),
  "/start": (BuildContext context) => StartScreen(),
  "/signup": (BuildContext context) => SignUpScreen(),
  "/about": (BuildContext context) => AboutScreen(),
  "/dev": (BuildContext context) => DevScreen(),
  "/gc": (BuildContext context) => SignUp(),
  "/error": (BuildContext context) => error(),
  "/contact": (BuildContext context) => ContactScreen(),
  "/success": (BuildContext context)=> SuccessScreen(),
  "/notify":(BuildContext context)=> NotificationScreen(),
  "/loc": (BuildContext context)=> LocationScreen(),
};

void main() => runApp(new MyApp());

class MyApp extends StatefulWidget {
  @override
  AppState createState() => new AppState();
}

class AppState extends State<MyApp> {
  final FirebaseMessaging _firebaseMessaging = new FirebaseMessaging();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _firebaseMessaging
        .requestNotificationPermissions(const IosNotificationSettings(
      sound: true,
      alert: true,
      badge: true,
    ));

    _firebaseMessaging.onIosSettingsRegistered
        .listen((IosNotificationSettings setting) {
      print("Ios");
    });

    _firebaseMessaging.configure(
      onLaunch: (Map<String, dynamic> message) {
        print('onLaunch');
      },
      onResume: (Map<String, dynamic> message) {
        print('onResume');
      },
      onMessage: (Map<String, dynamic> message) {
        print('onMessage');
      },
    );
    _firebaseMessaging.getToken().then((token) {
      print(token);
      U.token = token;
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
