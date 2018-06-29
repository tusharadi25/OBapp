import 'package:flutter/material.dart';
import 'package:ob_explorers/pages/Info.dart';

class MyNavigator {
  static void goToHome(BuildContext context) {
    Navigator.pushNamed(context, "/home");
  }

  static void goToLogin(BuildContext context) {
    Navigator.pushNamed(context, "/login");
  }

  static void goToStart(BuildContext context) {
    Navigator.pushNamed(context, "/start");
  }

  static void goToSignUp(BuildContext context) {
    Navigator.pushNamed(context, "/signup");
  }

  static void showInfo(BuildContext context, var data){
    Navigator.of(context).push(new PageRouteBuilder(pageBuilder:
    (context, animation, secondaryAnimation){
      return InfoScreen(data: data,);
    }));
  }
  static void goToAbout(BuildContext context) {
    Navigator.pushNamed(context, "/about");
  }

  static void goToDev(BuildContext context) {
    Navigator.pushNamed(context, "/dev");
  }

  static void goToGcreate(BuildContext context) {
    Navigator.pushNamed(context, "/gc");
  }


}

