import 'package:flutter/material.dart';
import 'package:ob_explorers/utils/ob.dart';

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
                radius: 70.0,
                backgroundImage: NetworkImage(
                    'https://firebasestorage.googleapis.com/v0/b/offbeat-explorers-adi25.appspot.com/o/tushar.jpg?alt=media&token=421006c6-54d9-4ea2-9ae9-45b74d702d7a'),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10.0, bottom: 30.0),
                child: Text('Tushar Adivarekar'),
              ),
              CircleAvatar(
                radius: 70.0,
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
                  onTap: () {})
            ],
          ),
        ),
      ),
    );
  }
}
