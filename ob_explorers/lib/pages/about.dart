import 'package:flutter/material.dart';
import 'package:ob_explorers/utils/ob.dart';

class AboutScreen extends StatelessWidget {
  final String name = ob.name;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("About"),
      ),
      body: ListView(
        padding: EdgeInsets.all(10.0),
        children: <Widget>[
          Image.network(
            'https://firebasestorage.googleapis.com/v0/b/offbeat-explorers-adi25.appspot.com/o/OB.jpg?alt=media&token=d8dd8ccf-6582-482e-9ea7-be944c589c01',
            fit: BoxFit.fitWidth,
          ),
          Padding(
            padding: EdgeInsets.only(top: 10.0),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              ob.ab,
              style: TextStyle(fontSize: 16.0),
              textAlign: TextAlign.justify,
            ),
          ),
          Image.network('https://firebasestorage.googleapis.com/v0/b/offbeat-explorers-adi25.appspot.com/o/36285168_2192848810936349_5408265760206225408_n.jpg?alt=media&token=e5094ec8-6f1b-4f8e-a437-9af6ebde7f9e',
          fit: BoxFit.fitWidth )
        ],
      ),
    );
  }
}
