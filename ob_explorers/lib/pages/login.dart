import 'package:flutter/material.dart';
import 'package:ob_explorers/utils/ob.dart';
import 'package:ob_explorers/utils/nav.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:async';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:ob_explorers/pages/Gcreate.dart';

class LoginScreen extends StatefulWidget {
  static String tag = 'login-page';

  @override
  _LoginPageState createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginScreen> {
  String _email, _pswd;
  final fkey = new GlobalKey<FormState>();
  bool validateAndSave() {
    final form = fkey.currentState;
    if (form.validate()) {
      form.save();
      print('Valid');
      return true;
    } else {
      print('Invalid');
      return false;
    }
  }

  void validateAndSubmit() async {
    if (validateAndSave()) {
      try {
        FirebaseUser user = await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: _email, password: _pswd);
        print('Signed in');
        if (user.email == _email) {
          U.user = user;
          MyNavigator.goToHome(context);
        }
      } catch (e) {
        print(e.toString());
      }
    }
  }

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
      onSaved: (value) => _email = value.trim(),
      validator: (value) => value.isEmpty ? 'Email can\'t be empty' : null,
      decoration: InputDecoration(
        labelText: 'Email',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
      ),
    );

    final password = TextFormField(
      autofocus: false,
      obscureText: true,
      onSaved: (value) => _pswd = value,
      validator: (value) => value.isEmpty ? 'Password can\'t be empty' : null,
      decoration: InputDecoration(
        labelText: 'Password',
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
          onPressed: validateAndSubmit,
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
      onPressed: () {},
    );

    void discri() {
      var newU = false;
      //TODO: check
      if (newU)
        MyNavigator.goToGcreate(context);
      else
        MyNavigator.goToHome(context);
    }

    Future<FirebaseUser> _handleSignIn() async {
      GoogleSignInAccount googleUser = await _googleSignIn.signIn();
      GoogleSignInAuthentication googleAuth = await googleUser.authentication;
      FirebaseUser user = await _auth.signInWithGoogle(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      U.user = user;
      print("signed in " + user.displayName);
      return user;
    }

    return Scaffold(
      backgroundColor: Colors.limeAccent[50],
      body: Container(
          child: Center(
        child: ListView(
          padding: EdgeInsets.only(left: 24.0, right: 24.0, top: 50.0),
          children: <Widget>[
            logo,
            SizedBox(height: 24.0),
            Form(
              key: fkey,
              child: Column(
                children: <Widget>[
                  email,
                  SizedBox(height: 24.0),
                  password,
                  SizedBox(height: 32.0),
                  loginButton,
                  forgotLabel,
                ],
              ),
            ),
            Divider(),
            MaterialButton(
              minWidth: 200.0,
              height: 45.0,
              onPressed: () => _handleSignIn()
                  .then((FirebaseUser user) => discri())
                  .catchError((e) => print(e)),
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
