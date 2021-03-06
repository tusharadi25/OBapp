import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ob_explorers/utils/nav.dart';
import 'package:ob_explorers/utils/ob.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:async';
import 'package:android_intent/android_intent.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  var tempU = U.user;

  String displayName() {
    var dn;
    try {
      dn = tempU.displayName;
      if (dn != null) {
        return tempU.displayName;
      }
      return tempU.email;
    } catch (e) {
      return tempU.email;
    }
  }

  Widget photoUrl() {
    var pu;
    try {
      pu = tempU.photoUrl;
      if (pu != null) {
        return CircleAvatar(
          backgroundImage: NetworkImage(tempU.photoUrl),
        );
      }
      return CircleAvatar(
        child: Text(
          tempU.email.toString().substring(0, 1).toUpperCase(),
          style: TextStyle(
            fontSize: 32.0,
          ),
        ),
      );
    } catch (e) {
      return CircleAvatar(
        child: Text(
          tempU.email.toString().substring(0, 1).toUpperCase(),
          style: TextStyle(
            fontSize: 32.0,
          ),
        ),
      );
    }
  }


  @override
  Widget build(BuildContext context) {

    Future<void> cleanpref() async{
      SharedPreferences pref = await SharedPreferences.getInstance();
      pref.setBool('login', false);
    }
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(title),
        elevation: 5.0,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.notifications), onPressed:()=> MyNavigator.showNotification(context) )
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                  image: DecorationImage(
                image: AssetImage('assets/bg.jpg'),
              )),
              accountName: Text(displayName()),
              accountEmail: Text(tempU.email),
              currentAccountPicture: photoUrl(),
            ),
            ListTile(
              title: Text('Home'),
              trailing: Icon(Icons.home,
              color: Colors.green,),
              onTap: () {
                Navigator.pop(context);
                MyNavigator.goToHome(context);
              },
            ),
            ListTile(
              title: Text('Places To Visit'),
              trailing: Icon(Icons.location_on,
              color: Colors.teal),
              onTap: (){
                Navigator.pop(context);
                MyNavigator.goToLocation(context);
              },
            ),
            ListTile(
              title: Text('Vlogs'),
              trailing: Icon(Icons.video_library,
              color: Colors.red,),
              onTap: (){
                Navigator.pop(context);
                final AndroidIntent intent = new AndroidIntent(
                    action: 'action_view',
                    data: Uri.encodeFull('https://www.youtube.com/channel/UC4tanoeIV9GFp1B2ro3TYZg',),
                    package: 'com.google.android.youtube');
                intent.launch();
              },
            ),
            ListTile(
              title: Text('About'),
              trailing: Icon(Icons.info,color: Colors.grey,),
              onTap: () {
                Navigator.pop(context);
                MyNavigator.goToAbout(context);
              },
            ),
            ListTile(
              title: Text('Contact Us'),
              trailing: Icon(Icons.phone,color: Colors.blue,),
              onTap: () {
                Navigator.pop(context);
                MyNavigator.goToContact(context);
              },
            ),
            ListTile(
              title: Text('Creaters'),
              trailing: Icon(Icons.create,color: Colors.orange,),
              onTap: () {
                Navigator.pop(context);
                MyNavigator.goToDev(context);
              },
            ),
            Column(
              children: <Widget>[
                Divider(),
                ListTile(
                  title: Text('SignOut'),
                  trailing: Icon(Icons.exit_to_app,color: Colors.black,),
                  onTap: () {
                    cleanpref();
                    FirebaseAuth.instance.signOut();
                    Navigator.of(context).pushNamedAndRemoveUntil(
                        '/login', (Route<dynamic> route) => false);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
      body: new StreamBuilder(
          stream: Firestore.instance
              .collection('Trips')
              .orderBy("SDate", descending: true)
              .snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData)
              return new Container(
                color: Colors.blue[200],
                child: Center(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Image.asset(
                          "assets/mc.png",
                          width: 200.0,
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
      elevation: 4.0,
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            FlatButton(
              child: Container(
                height: 150.0,
                child: Stack(
                  fit: StackFit.expand,
                  children: <Widget>[
                    Image.network(data.data["Image"],
                      fit: BoxFit.cover,
                    )
                  ],
                ),
              ),
              padding: EdgeInsets.all(0.0),
              onPressed: () => MyNavigator.showInfo(context, data),
            ),
            ListTile(
                title: Text(
                  data.data["Name"].toString().toUpperCase(),
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                ),
                onTap: () => MyNavigator.showInfo(context, data)),
            Divider(),
            Container(
              padding: EdgeInsets.symmetric(vertical: 10.0),
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
                    onPressed: () {
                      if(DateTime.now().compareTo(data.data['SDate'])>0 || data.data["Reg"]==false ){
                       return null;
                      }
                      else{
                        U.data = data;
                        MyNavigator.goToReg(context, data);
                      }
                    },
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
