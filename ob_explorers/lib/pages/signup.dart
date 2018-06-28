import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  static String tag = 'signup-page';
  @override
  _SignUpPageState createState() => new _SignUpPageState();
}

class _SignUpPageState extends State<SignUpScreen> {
  @override
  List<DropdownMenuItem<String>> elements = [];
  String sel;
  String _fn, _add, _em, _psw, _ph, _ecpn, _eph, _yr;
  void load() {
    elements = [];
    elements.add(new DropdownMenuItem(
      child: Text('A+'),
      value: 'A+',
    ));
    elements.add(new DropdownMenuItem(child: Text('A-'), value: 'A-'));
    elements.add(new DropdownMenuItem(child: Text('B+'), value: 'B+'));
    elements.add(new DropdownMenuItem(child: Text('B-'), value: 'B-'));
    elements.add(new DropdownMenuItem(child: Text('AB+'), value: 'AB+'));
    elements.add(new DropdownMenuItem(child: Text('AB-'), value: 'AB-'));
    elements.add(new DropdownMenuItem(child: Text('O+'), value: 'O+'));
    elements.add(new DropdownMenuItem(child: Text('O-'), value: 'O-'));
  }

  final _fkey = GlobalKey<FormState>();
  void validateAndSave() {
    final form = _fkey.currentState;
    if (form.validate()) {
      form.save();
      print("valid" +
          "$_fn, $_add, $_em, $_psw, $_ph, $_ecpn, $_eph, $_yr, $sel");
    } else
      print("Invalid");
  }

  Widget build(BuildContext context) {
    load();

    return Scaffold(
      appBar: AppBar(
        title: Text("Sign Up"),
        elevation: 4.0,
      ),
      backgroundColor: Colors.white,
      body: Container(
          child: Center(
        child: Form(
          key: _fkey,
          child: ListView(
            padding: EdgeInsets.only(left: 24.0, right: 24.0),
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(vertical: 4.0),
                child: Text(
                  "Personal Info",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22.0,
                  ),
                ),
              ),
              Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.0),
                  child: TextFormField(
                    validator: (value) =>
                        value.isEmpty ? 'Name Cannot be Empty' : null,
                    onSaved: (value) => _fn = value,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      hintText: "Full Name",
                    ),
                  )),
              Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.0),
                  child: DropdownButton(
                    value: sel,
                    items: elements,
                    hint: new Text("Select Blood Group"),
                    onChanged: (value) {
                      sel = value;
                      setState(() {});
                    },
                  )),
              Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.0),
                  child: TextFormField(
                    validator: (value) =>
                        value.isEmpty ? 'Address cannot be empty' : null,
                    onSaved: (value) => _add = value,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      hintText: "Address",
                    ),
                  )),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 4.0),
                child: Text(
                  "Contact Info",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22.0,
                  ),
                ),
              ),
              Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.0),
                  child: TextFormField(
                    validator: (value) =>
                        value.isEmpty ? 'Email-id Cannot be Empty' : null,
                    onSaved: (value) => _em = value,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      hintText: "Email Address",
                    ),
                  )),
              Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.0),
                  child: TextFormField(
                    validator: (value) =>
                        value.isEmpty ? 'Password Cannot be Empty' : null,
                    onSaved: (value) => _psw = value,
                    obscureText: true,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      hintText: "Your Password",
                    ),
                  )),
              Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.0),
                  child: TextFormField(
                    validator: (value) =>
                        value.isEmpty ? 'Phone no. Cannot be Empty' : null,
                    onSaved: (value) => _ph = value,
                    keyboardType: TextInputType.number,
                    maxLength: 10,
                    decoration: InputDecoration(
                      hintText: "Phone No.",
                    ),
                  )),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 4.0),
                child: Text(
                  "Emergency Info",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22.0,
                  ),
                ),
              ),
              Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.0),
                  child: TextFormField(
                    validator: (value) =>
                        value.isEmpty ? 'Field Cannot be Empty' : null,
                    onSaved: (value) => _ecpn = value,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      hintText: "Emergency Contact Person Name",
                    ),
                  )),
              Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.0),
                  child: TextFormField(
                    validator: (value) =>
                        value.isEmpty ? 'Field Cannot be Empty' : null,
                    onSaved: (value) => _eph = value,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: "Phone No.",
                    ),
                  )),
              Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.0),
                  child: TextFormField(
                    validator: (value) =>
                        value.isEmpty ? 'Field Cannot be Empty' : null,
                    onSaved: (value) => _yr = value,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      hintText: "Your Relation",
                    ),
                  )),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 30.0),
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
                            Icons.arrow_forward,
                            size: 40.0,
                          ),
                          Text('  SUBMIT',
                              style: TextStyle(
                                  color: Colors.black, fontSize: 20.0)),
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
      )),
    );
  }
}
