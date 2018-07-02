import 'dart:async';
import 'package:flutter/material.dart';
import 'package:ob_explorers/utils/ob.dart';
import 'package:ob_explorers/utils/nav.dart';
import 'package:connectivity/connectivity.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  Future<bool> netcheck() async{
    var connectivityResult = await (new Connectivity().checkConnectivity());
    if(connectivityResult==ConnectivityResult.mobile || connectivityResult == ConnectivityResult.wifi)
      return true;
    else return false;
  }

  Future<bool> checkLogin() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var b;
    try {
      b=pref.getBool('login');
      if(b==null) {
        pref.setBool('login', false);
        return false;
      }
      if(b==true)
        return true;
      return false;
    } catch (e){
      return false;
    }
  }

  void path(bool b){
      if(b==true)
        MyNavigator.goToLogin(context);
      else
        MyNavigator.goToStart(context);
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 3), () {
      netcheck().then((bool a) {
        if (a) {
          checkLogin().then((bool b) => path(b));
        } else {
          MyNavigator.error(context);
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            color: Colors.deepOrangeAccent,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 60.0,
                        child: Icon(
                          Icons.terrain,
                          color: Colors.greenAccent,
                          size: 70.0,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10.0),
                      ),
                      Text(
                        ob.name,
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 24.0),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CircularProgressIndicator(),
                    Padding(
                      padding: EdgeInsets.only(top: 20.0),
                    ),
                    Text(
                      ob.tagline,
                      softWrap: true,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0,
                          color: Colors.white),
                    )
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
