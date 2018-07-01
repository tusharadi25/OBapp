import 'package:flutter/material.dart';
import 'package:ob_explorers/utils/ob.dart';
import 'package:url_launcher/url_launcher.dart';

class DevScreen extends StatelessWidget {
  final String name = ob.name;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Developers"),
      ),
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                backgroundColor: Colors.red,
                radius: 60.0,
                backgroundImage: NetworkImage(
                    'https://firebasestorage.googleapis.com/v0/b/offbeat-explorers-adi25.appspot.com/o/17457751_1851848141694381_863714491079479479_n.jpg?alt=media&token=9cb3bdaf-3880-41cb-b3d7-ef0ee2619c76'),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                child: Column(
                  children: <Widget>[
                    Text('Tushar Adivarekar'),
                    FlatButton(
                      child: Text('Call 8082399862'),
                      onPressed: () async {
                        const url = 'tel:+918082399862';
                        if (await canLaunch(url)) {
                          await launch(url);
                        } else {
                          throw 'Could not launch $url';
                        }
                      },
                    )
                  ],
                ),
              ),
              CircleAvatar(
                radius: 60.0,
                backgroundImage: NetworkImage(
                    'https://firebasestorage.googleapis.com/v0/b/offbeat-explorers-adi25.appspot.com/o/shree.jpeg?alt=media&token=f53eda2f-3f56-41f2-9bf5-b801b203b644'),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                child: Text('Shreedhar Prabhu'),
              ),
              ListTile(
                  title: Text(
                    "Contact",
                    textAlign: TextAlign.center,
                  ),
                  subtitle: Text(
                    'adi25.prabhu@gmail.com',
                    textAlign: TextAlign.center,
                  ),
                  onTap: () async {
                    const url = 'mailto:adi25.prabhu@gmail.com';
                    if (await canLaunch(url)) {
                      await launch(url);
                    } else {
                      throw 'Could not launch $url';
                    }
                  })
            ],
          ),
        ),
      ),
    );
  }
}
