import 'package:flutter/material.dart';

class Error extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Icon(Icons.signal_wifi_off,
            size: 90.0,
            color: Colors.red ,),
            Padding( padding: EdgeInsets.all(10.0),
              child: Text('Connect to Internet'),
            ),
          ],
        ),
      ),
    );
  }
}
