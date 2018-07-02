import 'package:flutter/material.dart';
import 'package:ob_explorers/utils/ob.dart';
import 'package:ob_explorers/utils/nav.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:async';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

  Future<bool> savePref(String email, String pswd) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString('email',email);
    pref.commit();
    pref.setString('pswd',pswd);
    print(''+email+pswd);
    return pref.commit();
  }

  Future<String> loadPref(String name) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString(name);
  }

  void validateAndSubmit() async {
    if (validateAndSave()) {
      try {
        SharedPreferences pref = await SharedPreferences.getInstance();
        FirebaseUser user = await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: _email, password: _pswd);
        print('Signed in');
        savePref(_email,_pswd);
        if (user.email == _email) {
          pref.setBool('login', true);
          print('nice');
          U.user = user;
          MyNavigator.goToHome(context);
        }
      } catch (e) {
        print(e.toString());
      }
    }
  }

  Future<bool> checkLogin() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var b;
    try {
      b=pref.getBool('login');
      return b;
    } catch (e){
      pref.setBool('login', false);
      return false;
    }
  }

  void s(bool b) async{
    if(b==true){
      MyNavigator.goLoad(context);
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
        radius: 60.0,
        child: Image.asset('assets/logo.png'),
      ),
    );

    checkLogin().then((bool a)=>s(a));

    final email = TextFormField(
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
      onSaved: (value) => _email = value.trim(),
      validator: (value) => value.isEmpty ? 'Email can\'t be empty' : null,
      decoration: InputDecoration(
        labelText: 'Email',
        contentPadding: EdgeInsets.fromLTRB(00.0, 00.0, 0.0, 0.0),
      ),
    );

    final password = TextFormField(
      autofocus: false,
      obscureText: true,
      onSaved: (value) => _pswd = value,
      validator: (value) => value.isEmpty ? 'Password can\'t be empty' : null,
      decoration: InputDecoration(
        labelText: 'Password',
        contentPadding: EdgeInsets.fromLTRB(00.0, 00.0, 00.0, 00.0),
      ),
    );

    final loginButton = Padding(
      padding: EdgeInsets.symmetric(vertical: 6.0),
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
      onPressed: () {
        final form = fkey.currentState;
        form.save();
        FirebaseAuth.instance.sendPasswordResetEmail(email: _email);
      },
    );

    void discri(FirebaseUser user) {
      var newU = true;
      Firestore.instance.collection('Udb').document('${user.uid}').get().then((DocumentSnapshot d){
        if(d.exists) {
          newU = false;
        }      //TODO: check
        if(newU) {
          MyNavigator.goToGcreate(context);
        }else {
          MyNavigator.goToHome(context);
        }
      });
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
           // Divider(),
           // MaterialButton(
           //   minWidth: 200.0,
            //  height: 45.0,
           //   onPressed: () => _handleSignIn()
            //      .then((FirebaseUser user) => discri(user))
             //     .catchError((e) => print(e)),
             // color: Colors.lightBlueAccent,
             // splashColor: Colors.greenAccent,
             // child: Text('Sign In with Google',
              //    style: TextStyle(color: Colors.white)),
           // ),

          ],
        ),
      )),
    );
  }
}
