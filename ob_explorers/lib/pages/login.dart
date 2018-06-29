import 'package:flutter/material.dart';
import 'package:ob_explorers/utils/ob.dart';
import 'package:ob_explorers/utils/nav.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:async';
import 'package:google_sign_in/google_sign_in.dart';

class LoginScreen extends StatefulWidget {
  static String tag = 'login-page';
  @override
  _LoginPageState createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    final GoogleSignIn _googleSignIn = new GoogleSignIn();
    final logo = Hero(
      tag: ob.name,
      child: CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: 70.0,
        child: Image.asset('assets/logo.png'),
      ),
    );

    final email = TextFormField(
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
      decoration: InputDecoration(
        hintText: 'Email',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
      ),
    );

    final password = TextFormField(
      autofocus: false,
      obscureText: true,
      decoration: InputDecoration(
        hintText: 'Password',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
      ),
    );

    final loginButton = Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        borderRadius: BorderRadius.circular(30.0),
        shadowColor: Colors.lightBlueAccent.shade100,
        elevation: 5.0,
        child: MaterialButton(
          minWidth: 200.0,
          height: 45.0,
          onPressed: () {
            var u = null;
            if (u == null) {
              MyNavigator.goToHome(context);
            }
          },
          color: Colors.green,
          splashColor: Colors.greenAccent,
          child: Text('Log In', style: TextStyle(color: Colors.white)),
        ),
      ),
    );

    final forgotLabel = FlatButton(
      child: Text(
        'Forgot password?',
        style: TextStyle(color: Colors.black54),
      ),
      onPressed: () {
      },
    );

    return Scaffold(
      backgroundColor: Colors.limeAccent[50],
      body: Container(
          child: Center(
        child: ListView(
          padding: EdgeInsets.only(left: 24.0, right: 24.0, top: 50.0),
          children: <Widget>[
            logo,
            SizedBox(height: 24.0),
            email,
            SizedBox(height: 24.0),
            password,
            SizedBox(height: 32.0),
            loginButton,
            forgotLabel,
            Divider(),
            MaterialButton(
              minWidth: 200.0,
              height: 45.0,
              onPressed: () {
                Future<FirebaseUser> _handleSignIn() async {
                  GoogleSignInAccount googleUser = await _googleSignIn.signIn();
                  GoogleSignInAuthentication googleAuth =
                      await googleUser.authentication;
                  FirebaseUser user = await _auth.signInWithGoogle(
                    accessToken: googleAuth.accessToken,
                    idToken: googleAuth.idToken,
                  );
                  print("signed in " + user.displayName);
                  MyNavigator.goToHome(context);
                  return user;
                }

                var u = _handleSignIn();
                print(u.toString());
              },
              color: Colors.lightBlueAccent,
              splashColor: Colors.greenAccent,
              child: Text('Sign In with Google',
                  style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      )),
    );
  }
}
