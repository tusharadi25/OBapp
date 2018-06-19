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
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CircleAvatar(),
                      Padding(
                        padding: EdgeInsets.only(top: 10.0),
                      ),
                      Text(ob.name),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    RaisedButton(
                      child: Text('LOGIN'),
                      onPressed: () =>
                        MyNavigator.goToLogin(context)
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 20.0),
                    ),
                    RaisedButton(
                      child: Text('SIGNUP'),
                      splashColor: Colors.red,
                      onPressed: () => {},
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
