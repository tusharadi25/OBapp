import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Color c = const Color.fromRGBO(255, 128, 66, 1.0);
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.red,
      ),
      home: new Scaffold(
        appBar: AppBar(
          title: new Text("Offbeat"),
        ),
        body: new Text("Hello"),
      ),
    );
  }
}
