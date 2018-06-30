import 'package:flutter/material.dart';
import 'package:ob_explorers/utils/ob.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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
      var attendies = U.data.data["Attendies"];
      var n = attendies.length;
      /*attendies.add({
        'Uid': 'Udb/${U.user.uid}',
        'VehicleType': '$sel',
        'Model': '$_bm',
        'CC': '$_cc',
        'Pillion': '$_prn',
        'Other': '$_od'
      });*/
      print(n);
      /*var temp = new List<Object>.from(attendies);
      temp.add({
        'Uid': 'Udb/${U.user.uid}',
        'VehicleType': '$sel',
        'Model': '$_bm',
        'CC': '$_cc',
        'Pillion': '$_prn',
        'Other': '$_od'
      });*/
      //print(attendies[n]);
      /*
      Firestore.instance
          .collection('Trip')
          .document('${U.data.documentID}')
          .updateData({
        'Attendies': {
          'Uid': 'Udb/${U.user.uid}',
          'VehicleType': '$sel',
          'Model': '$_bm',
          'CC': '$_cc',
          'Pillion': '$_prn',
          'Other': '$_od'
        }
      });
      */
      DocumentReference c =
          Firestore.instance.collection('Trips').document(U.data.documentID);
      String x = U.data.documentID;
      var y = Firestore.instance
          .collection('Trips')
          .document(x)
          .get()
          .then((DocumentSnapshot d) {
        var temp = new List<Object>.from(d["Attendies"]);
        print(d["Attendies"]);
        temp.add({
          'Uid': 'Udb/${U.user.uid}',
          'VehicleType': '$sel',
          'Model': '$_bm',
          'CC': '$_cc',
          'Pillion': '$_prn',
          'Other': '$_od'
        });
        Firestore.instance.collection('Trips').document(x).updateData();
      });
      //Firestore.instance.collection('Trip').document('${U.data.documentID}')["Attendies"];
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
                padding: EdgeInsets.all(8.0),
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
                padding: EdgeInsets.all(8.0),
                child: TextFormField(
                  onSaved: (value) => _bm = value,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: "Vehicle Model",
                  ),
                )),
            Padding(
                padding: EdgeInsets.all(8.0),
                child: TextFormField(
                  onSaved: (value) => _cc = value,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: "CC",
                  ),
                )),
            Padding(
                padding: EdgeInsets.all(8.0),
                child: TextFormField(
                  onSaved: (value) => _prn = value,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: "Pillion Rider Name",
                  ),
                )),
            Padding(
                padding: EdgeInsets.all(8.0),
                child: TextFormField(
                  maxLines: 3,
                  onSaved: (value) => _od = value,
                  keyboardType: TextInputType.multiline,
                  decoration: InputDecoration(
                    labelText: "Other Details",
                  ),
                )),
            Padding(
              padding: EdgeInsets.all(8.0),
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
                        Text('Accept And Continue',
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
