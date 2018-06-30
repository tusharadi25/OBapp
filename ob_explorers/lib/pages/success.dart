import 'package:flutter/material.dart';
import 'package:ob_explorers/utils/ob.dart';
import 'package:android_intent/android_intent.dart';
import 'package:ob_explorers/utils/nav.dart';

class SuccessScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white70,
        child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              " Registration Successful!",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
                color: Colors.green,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10.0),
            ),
            Icon(
              Icons.check_circle,
              size: 150.0,
              color: Colors.greenAccent,
            ),
            Padding(
              padding: EdgeInsets.only(top: 10.0),
              child: Text(
                  'Thanks! ${U.user.email} \n For your registration in ' +
                      '${U.data.data["Name"]}',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 15.0),),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  RaisedButton(
                    child: Text("Pay Now"),
                    color: Colors.lightBlue,
                    elevation: 5.0,
                    padding: EdgeInsets.all(10.0),
                    onPressed: () {
                      final AndroidIntent intent = new AndroidIntent(
                          action: 'action_view',
                          data: Uri.encodeFull('${U.data.data["PayUrl"]}',),
                          package: 'com.android.chrome');
                      intent.launch();
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.all(30.0),
                    child: FlatButton(
                        onPressed: () => MyNavigator.goToHome(context),
                        child: Text('Home')),
                  )
                ],
              ),
            )
          ],
        ),
      ),
      ),
    );
  }
}
