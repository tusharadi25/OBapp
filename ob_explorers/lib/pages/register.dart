import 'package:flutter/material.dart';
import 'package:android_intent/android_intent.dart';

class RegisterScreen extends StatelessWidget {
  var data;

  RegisterScreen({Key key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
      ),
      body: Container(
        child: RaisedButton(
          child: Text(data.data["Name"]),
          onPressed: () {
            final AndroidIntent intent = new AndroidIntent(
                action: 'action_view',
                data: Uri.encodeFull('https://www.google.com'),
                package: 'com.android.chrome');
            intent.launch();
          },
        ),
      ),
    );
  }
}
