import 'package:flutter/material.dart';
import 'package:ob_explorers/utils/ob.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ob_explorers/utils/nav.dart';
import 'package:android_intent/android_intent.dart';

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
  String _bm, _cc, _prn, _od;
  void validateAndSave() {
    final form = _newkey.currentState;
    form.save();
    if (form.validate()) if (sel != null) {
      print("valid" + "$_bm,$_cc,$_prn,$_od,$sel");
      Firestore.instance
          .collection('Attendies')
          .document('${U.data.data["SDate"]}')
          .setData({
        '${U.user.email}': {
          'Uid': 'Udb/${U.user.uid}',
          'VehicleType': '$sel',
          'Model': '$_bm',
          'CC': '$_cc',
          'Pillion': '$_prn',
          'Other': '$_od'
        },
      }, merge: true);
      final AndroidIntent intent = new AndroidIntent(
          action: 'action_view',
          data: Uri.encodeFull('${U.data.data["PayUrl"]}',),
          package: 'com.android.chrome');
      intent.launch();
      MyNavigator.goToHome(context);
    } else
      print("Invalid");
  }

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
                    padding: const EdgeInsets.symmetric(
                        vertical: 14.0, horizontal: 10.0),
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
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: DropdownButton(
                  value: sel,
                  items: elements,
                  hint: new Text("Select Vehicle"),
                  onChanged: (value) {
                    sel = value;
                    setState(() {});
                  },
                )),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: TextFormField(
                  onSaved: (value) => _bm = value,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: "Vehicle Model",
                  ),
                )),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: TextFormField(
                  onSaved: (value) => _cc = value,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: "CC",
                  ),
                )),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: TextFormField(
                  onSaved: (value) => _prn = value,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: "Pillion Rider Name",
                  ),
                )),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: TextFormField(
                  maxLines: 4,
                  maxLengthEnforced: false,
                  onSaved: (value) => _od = value,
                  keyboardType: TextInputType.multiline,
                  decoration: InputDecoration(
                    labelText: "Other Details",
                  ),
                )),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0,vertical: 5.0),
              child: Text(
                ob.dec,
                style: TextStyle(fontSize: 16.0),
                textAlign: TextAlign.justify,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 40.0),
              child: Material(
                  borderRadius: BorderRadius.circular(30.0),
                  shadowColor: Colors.green,
                  elevation: 5.0,
                  child: MaterialButton(
                    padding: EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.person_add,
                        ),
                        Padding(padding: EdgeInsets.symmetric(horizontal:5.0),),
                        Text('Register and Pay',
                            style:
                                TextStyle(color: Colors.black, fontSize: 20.0)),
                      ],
                    ),
                    minWidth: 110.0,
                    color: Colors.green,
                    splashColor: Colors.greenAccent,
                    onPressed: validateAndSave,
                  )),
            )
          ],
        ),
      ),
    );
  }
}
