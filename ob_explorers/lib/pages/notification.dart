import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class NotificationScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return  Scaffold(
      appBar: AppBar(title: Text("Notifications"),),
      body: StreamBuilder(
          stream: Firestore.instance
              .collection('Notifications')
              .orderBy("Time", descending: true)
              .snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData)
              return new Container(
                color: Colors.lime[200],
                child: Center(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(Icons.notifications,
                          size: 100.0,
                          color: Colors.blue,
                        ),
                        Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Text("Loading...."),
                        ),
                        CircularProgressIndicator(),
                      ]),
                ),
              );
            return new ListView.builder(
                physics: const AlwaysScrollableScrollPhysics(),
                itemCount: snapshot.data.documents.length,
                padding: const EdgeInsets.only(top: 10.0, bottom: 20.0),
                itemBuilder: (context, index) {
                  DocumentSnapshot ds = snapshot.data.documents[index];
                  return MyNotification(d: ds);
                });
          }),
    );
  }
}

class MyNotification extends StatelessWidget{
  final d;
  const MyNotification({Key key, this.d}) : super(key: key);

  Widget build(BuildContext context){
    return Card(
      color: Colors.white,
    elevation: 4.0,
    child: Padding(padding: EdgeInsets.all(10.0),
    child: ListTile(
      title: Text(d.data["Text"]),
      trailing: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[Text(d.data["Time"].toString().substring(0,10),
        style: TextStyle(fontSize: 10.0),),
        Text(d.data["Time"].toString().substring(11,16),
          style: TextStyle(fontSize: 10.0),)],
      ),
      subtitle: Text(d.data["Lable"]),
    ),),);
  }

}