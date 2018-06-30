import 'package:flutter/material.dart';
import 'package:ob_explorers/pages/Info.dart';
import 'package:ob_explorers/pages/register.dart';
import 'package:ob_explorers/pages/locations.dart';

class MyNavigator {
  static void goToHome(BuildContext context) {
    Navigator
        .of(context)
        .pushNamedAndRemoveUntil('/home', (Route<dynamic> route) => false);
  }

  static void goToLogin(BuildContext context) {
    Navigator.pushNamed(context, "/login");
  }

  static void goToStart(BuildContext context) {
    Navigator
        .of(context)
        .pushNamedAndRemoveUntil('/start', (Route<dynamic> route) => false);
  }

  static void goToSignUp(BuildContext context) {
    Navigator.pushNamed(context, "/signup");
  }

  static void goToLocation(BuildContext context) {
    Navigator.pushNamed(context, "/loc");
  }

  static void showNotification(BuildContext context) {
    Navigator.pushNamed(context, "/notify");
  }

  static void success(BuildContext context) {
    Navigator.pushNamed(context, "/success");
  }


  static void showInfo(BuildContext context, var data) {
    Navigator.of(context).push(new PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) {
      return InfoScreen(
        data: data,
      );
    }));
  }

  static void showLoc(BuildContext context, var d) {
    Navigator.of(context).push(new PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) {
          return Loc(d: d,);
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

  static void error(BuildContext context) {
    Navigator.pushNamed(context, "/error");
  }

  static void goToContact(BuildContext context) {
    Navigator.pushNamed(context, "/contact");
  }

  static void goToReg(BuildContext context, var data) {
    Navigator.of(context).push(new PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) {
      return RegisterScreen(
        data: data,
      );
    }));
  }
}
