import 'package:flutter/material.dart';
import 'package:android_intent/android_intent.dart';

class SucessScreen extends StatelessWidget {
  var data;

  SucessScreen({Key key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: RaisedButton(
            color: Colors.blue,
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
      ),
    );
  }
}
