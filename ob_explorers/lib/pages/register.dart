import 'package:flutter/material.dart';
import 'package:ob_explorers/utils/ob.dart';

class RegisterScreen extends StatefulWidget {
  var data;
  RegisterScreen({Key key, this.data}) : super(key: key);
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _newkey = GlobalKey<FormState>();
  List<DropdownMenuItem<String>> elements = [];
  String sel;
  void load() {
    elements = [];
    elements.add(new DropdownMenuItem(child: Text('Bike'), value: 'Bike'));
    elements.add(new DropdownMenuItem(child: Text('Car'), value: 'Car'));
    elements.add(new DropdownMenuItem(child: Text('Other'), value: 'Other'));
  }

  @override
  Widget build(BuildContext context) {
    load();
    var data = U.data;
    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
      ),
      body: Form(
        key: _newkey,
        child: ListView(
          children: <Widget>[
            Container(
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 14.0),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Text(
                            data.data["Name"],
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Divider(),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 14.0, vertical: 8.0),
              child: Text(
                "Bike Details",
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
                child: DropdownButton(
                  value: sel,
                  items: elements,
                  hint: new Text("Select Vehicle"),
                  onChanged: (value) {
                    sel = value;
                    setState(() {});
                  },
                )),
          ],
        ),
      ),
    );
  }
}
