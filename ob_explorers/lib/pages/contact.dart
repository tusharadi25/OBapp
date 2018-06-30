import 'package:flutter/material.dart';
import 'package:android_intent/android_intent.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactScreen extends StatelessWidget {
  _openMap() async {
    const url = 'https://www.google.com/maps/search/?api=1&query=Kandivili';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contact Us'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Center(
          child: ListView(
            children: <Widget>[
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Feel Free To Contact Us",
                    style: TextStyle(fontSize: 24.0),
                  ),
                ),
              ),
              Center(
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: <Widget>[
                          Icon(
                            Icons.phone,
                            size: 20.0,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10.0),
                          ),
                          Text(
                            "90227 08087 ( SACHIN DESHMUKH )",
                            style: TextStyle(fontSize: 16.0),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: <Widget>[
                          Icon(
                            Icons.phone,
                            size: 20.0,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10.0),
                          ),
                          Text(
                            "98211 23491 ( VIPUL SAWANT )",
                            style: TextStyle(fontSize: 16.0),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: <Widget>[
                          Icon(
                            Icons.email,
                            size: 20.0,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10.0),
                          ),
                          Text(
                            "obexplorers@gmail.com",
                            style: TextStyle(fontSize: 16.0),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: <Widget>[
                          Text(
                            "f",
                            style: TextStyle(
                                fontSize: 24.0, fontWeight: FontWeight.bold),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10.0),
                          ),
                          Text(
                            "https://www.facebook.com/pages/Offbeat-Explorers",
                            textScaleFactor: 0.9,
                            style: TextStyle(fontSize: 16.0),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: <Widget>[
                          Icon(
                            Icons.camera_alt,
                            size: 20.0,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10.0),
                          ),
                          Text(
                            "https://instagram.com/offbeat_explorers",
                            style: TextStyle(fontSize: 16.0),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: FlatButton(
                  child: Text("Locate Us"),
                  onPressed: () {
                    _openMap();
                    /*
                      final AndroidIntent intent = new AndroidIntent(
                        action: 'action_view',
                        data: Uri.encodeFull('https://www.google.com'),
                        package: 'com.android.chrome');
                    intent.launch();*/
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
