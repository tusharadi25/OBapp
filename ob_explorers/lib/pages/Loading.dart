import 'package:flutter/material.dart';
import 'package:ob_explorers/utils/ob.dart';
import 'package:ob_explorers/utils/cards.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ob_explorers/utils/nav.dart';
import 'dart:async';

class load extends StatelessWidget {
  final String name = ob.name;

  @override
  Widget build(BuildContext context) {
    Future<bool> savePref(String email, String pswd) async {
      SharedPreferences pref = await SharedPreferences.getInstance();
      pref.setString('email', email);
      pref.commit();
      pref.setString('pswd', pswd);
      print('' + email + pswd);
      return pref.commit();
    }

    Future<String> loadPref(String name) async {
      SharedPreferences pref = await SharedPreferences.getInstance();
      return pref.getString(name);
    }

    Future<void> login(String _email, String _pswd) async {
      try {
        FirebaseUser user = await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: _email, password: _pswd);
        print('Signed in');
        savePref(_email, _pswd);
        if (user.email == _email) {
          U.user = user;
          MyNavigator.goToHome(context);
        }
      } catch (e) {
        print(e.toString());
      }
    }


    Future<void> log() async {
      var _email, _pswd;
      try {
        SharedPreferences pref = await SharedPreferences.getInstance();
        loadPref('email').then((String e) {
          loadPref('pswd').then((String p) {
              login(e,p);
          });
        }
        );
      }
      catch(e){

      }
    }


    log();

    return Scaffold(body:  Container(
          color: Colors.greenAccent,
        child:
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              CircularProgressIndicator(),
              Padding(padding: EdgeInsets.all(5.0),),
              Text("Signing In....")
            ],
          ),
        ),
    ),
    );
  }
}
