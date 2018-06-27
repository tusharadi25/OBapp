import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ob_explorers/utils/nav.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(title),
        elevation: 4.0,
      ),
      body: new StreamBuilder(
          stream: Firestore.instance.collection('Trips').snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) return const Text('Loading...');
            return new ListView.builder(
                itemCount: snapshot.data.documents.length,
                padding: const EdgeInsets.only(top: 10.0),
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
  String findMonth(DateTime d) {
    int dout = d.month;
    switch (dout) {
      case 1:
        return "Jan";
      case 2:
        return "Feb";
      case 3:
        return "Mar";
      case 4:
        return "Apr";
      case 5:
        return "May";
      case 6:
        return "June";
      case 7:
        return "July";
      case 8:
        return "Aug";
      case 9:
        return "Sept";
      case 10:
        return "Oct";
      case 11:
        return "Nov";
      case 12:
        return "Dec";
      default:
        return "Error";
    }
  }

  const MyCard({Key key, this.data}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var info = data.data["Information"];
    return Card(
      color: Colors.white,
      elevation: 5.0,
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Container(
              height: 150.0,
              child: Stack(
                fit: StackFit.expand,
                children: <Widget>[
                  Image.network(
                    data.data["Image"],
                    fit: BoxFit.cover,
                  )
                ],
              ),
            ),
            ListTile(
                title: Text(
                  data.data["Name"].toString().toUpperCase(),
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                ),
                onTap: () => MyNavigator.showInfo(context, data)),
            Divider(),
            Container(
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(left: 20.0),
                      ),
                      Text(
                        data.data["SDate"].day.toString() +
                            " " +
                            findMonth(data.data["SDate"]) +
                            " " +
                            data.data["SDate"].year.toString(),
                        style: TextStyle(fontSize: 15.0),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5.0),
                        child: Icon(
                          Icons.arrow_forward,
                          size: 18.0,
                        ),
                      ),
                      Text(
                        data.data["EDate"].day.toString() +
                            " " +
                            findMonth(data.data["EDate"]) +
                            " " +
                            data.data["EDate"].year.toString(),
                        style: TextStyle(fontSize: 15.0),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 4.0),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(left: 20.0),
                      ),
                      Text(
                        info["Duration"],
                        style: TextStyle(fontSize: 15.0),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 20.0),
                      ),
                      Text(
                        info["ModeOfTrans"].toString(),
                        style: TextStyle(fontSize: 15.0),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4.0),
                        child: Icon(
                          Icons.directions_bike,
                          size: 18.0,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 10.0),
                      ),
                      Text(
                        info["Distance"],
                        style: TextStyle(fontSize: 15.0),
                      ),
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
                      onPressed: () => MyNavigator.showInfo(context, data)),
                  MaterialButton(
                    color: Colors.blue,
                    elevation: 3.0,
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
