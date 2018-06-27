import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ob_explorers/utils/nav.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text(title)),
      body: new StreamBuilder(
          stream: Firestore.instance.collection('Trips').snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) return const Text('Loading...');
            return new ListView.builder(
                itemCount: snapshot.data.documents.length,
                padding: const EdgeInsets.only(top: 10.0),
                itemExtent: 500.0,
                itemBuilder: (context, index) {
                  DocumentSnapshot ds = snapshot.data.documents[index];
                  return MyCard(data: ds);
                });
          }),
    );
  }
}

class MyCard extends StatelessWidget {
  final data;
  const MyCard({Key key, this.data}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var info = data.data["Information"];
    return Card(
      elevation: 5.0,
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Container(
              width: 300.0,
              child: Image.network(
                data.data["Image"],
                fit: BoxFit.fitWidth,
              ),
            ),
            ListTile(
                title: Text(data.data["Name"].toString()),
                onTap: () => MyNavigator.showInfo(context,data)
            ),
            Container(
              child: Column(
                children: <Widget>[
                  Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Padding(padding: EdgeInsets.only(left: 20.0),),
                      Text(data.data["SDate"].toString().substring(0, 10)),
                      Text(' --> '),
                      Text(data.data["EDate"].toString().substring(0,10)),
                      Padding(
                        padding: EdgeInsets.only(right: 10.0),
                      ),
                      Text(info["Duration"]),
                    ],
                  ),
                  Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Padding(padding: EdgeInsets.only(left: 20.0),),
                      Text(info["ModeOfTrans"].toString()),
                      Padding(
                        padding: EdgeInsets.only(right: 10.0),
                      ),
                      Text(info["Distance"]),
                    ],
                  ),
                ],
              ),
            ),
            ButtonTheme.bar(
              // make buttons use the appropriate styles for cards
              child: ButtonBar(
                children: <Widget>[
                  FlatButton(
                    child: const Text(
                      'Info',
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                    onPressed: () =>  MyNavigator.showInfo(context,data)
                  ),
                  MaterialButton(
                    color: Colors.blue,
                    child: const Text(
                      'Register',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    onPressed: () {/* ... */},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
