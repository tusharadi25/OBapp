import 'package:flutter/material.dart';

class InfoScreen extends StatelessWidget {
  final data;
  const InfoScreen({Key key, this.data}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(
          data.data["Name"],
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Image.network(data.data["Image"],
              fit: BoxFit.fitWidth,),
              Text(
                data.data["Name"],
                style: TextStyle(
                  color: Colors.black38,
                  fontSize: 20.0,
                ),
              ),
              Divider(),
              Text(
                data.data["About"],
                softWrap: true,
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontSize: 12.0,
                  color: Colors.grey,
                ),
              ),
              Divider(),
            ],
          ),
      ),
    );
  }
}
