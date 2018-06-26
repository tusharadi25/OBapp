import 'package:flutter/material.dart';
import 'package:ob_explorers/utils/ob.dart';
import 'package:ob_explorers/utils/nav.dart';

class StartScreen extends StatelessWidget {
  final String name = ob.name;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(color: Colors.deepOrange[400]),
          ),
          Column(
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 70.0,
                        child: Image.asset('assets/logo.png'),
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
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10.0),
                      ),
                      Container(
                        width: 350.0,
                        child: Text(
                          ob.intro,
                          textAlign: TextAlign.center,
                          softWrap: true,
                          style: TextStyle(
                              wordSpacing: 1.0,
                              color: Colors.white70,
                              fontWeight: FontWeight.normal,
                              fontSize: 13.0),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  width: 200.0,
                  child: Column(
                    children: <Widget>[
                      Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Material(
                              borderRadius: BorderRadius.circular(30.0),
                              elevation: 5.0,
                              child: MaterialButton(
                                  elevation: 5.0,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Icon(
                                        Icons.person,
                                        size: 40.0,
                                      ),
                                      Text("  LOGIN",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 20.0)),
                                    ],
                                  ),
                                  minWidth: 300.0,
                                  color: Colors.blue,
                                  padding: EdgeInsets.all(8.0),
                                  splashColor: Colors.blueAccent,
                                  onPressed: () =>
                                      MyNavigator.goToLogin(context)))),
                      Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Material(
                            borderRadius: BorderRadius.circular(30.0),
                            elevation: 5.0,
                            child: MaterialButton(
                              elevation: 5.0,
                              padding: EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Icon(
                                    Icons.person_add,
                                    size: 40.0,
                                  ),
                                  Text('  SIGNUP',
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 20.0)),
                                ],
                              ),
                              minWidth: 110.0,
                              color: Colors.green,
                              splashColor: Colors.greenAccent,
                              onPressed: () => MyNavigator.goToSignUp(context),
                            )),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
