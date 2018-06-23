import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  static String tag = 'signup-page';
  @override
  _SignUpPageState createState() => new _SignUpPageState();
}

class _SignUpPageState extends State<SignUpScreen> {
  @override
  List<DropdownMenuItem<String>> elements = [];
  String sel = null;
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

  Widget build(BuildContext context) {
    load();

    final heading = Text(
      "Personal Info",
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 22.0,
      ),
    );

    final fullName = Padding(
        padding: EdgeInsets.symmetric(vertical: 10.0),
        child: TextFormField(
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
            hintText: "Full Name",
          ),
        ));

    final bloodGroup = Padding(
        padding: EdgeInsets.symmetric(vertical: 10.0),
        child: DropdownButton(
          value: sel,
          items: elements,
          hint: new Text("Select Blood Group"),
          onChanged: (value) {
            sel = value;
            setState(() {});
          },
        ));

    final address = Padding(
        padding: EdgeInsets.symmetric(vertical: 10.0),
        child: TextFormField(
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
            hintText: "Address",
          ),
        ));

    final personalInfo = Container(
      child: ListView(
        shrinkWrap: true,
        children: <Widget>[heading, fullName, bloodGroup, address],
      ),
    );
    final heading2 = Text(
      "Contact Info",
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 22.0,
      ),
    );

    final email = Padding(
        padding: EdgeInsets.symmetric(vertical: 10.0),
        child: TextFormField(
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            hintText: "Email Address",
          ),
        ));

    final phone = Padding(
        padding: EdgeInsets.symmetric(vertical: 10.0),
        child: TextFormField(
          keyboardType: TextInputType.number,
          maxLength: 10,
          decoration: InputDecoration(
            hintText: "Phone No.",
          ),
        ));

    final contactInfo = Container(
        child: ListView(
      shrinkWrap: true,
      children: <Widget>[heading2, email, phone],
    ));

    final heading3 = Text(
      "Emergency Info",
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 22.0,
      ),
    );

    final emergencyName = Padding(
        padding: EdgeInsets.symmetric(vertical: 10.0),
        child: TextFormField(
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
            hintText: "Emergency Contact Person Name",
          ),
        ));

    final phone2 = Padding(
        padding: EdgeInsets.symmetric(vertical: 10.0),
        child: TextFormField(
          keyboardType: TextInputType.number,
          maxLength: 10,
          decoration: InputDecoration(
            hintText: "Phone No.",
          ),
        ));

    final relation = Padding(
        padding: EdgeInsets.symmetric(vertical: 10.0),
        child: TextFormField(
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
            hintText: "Your Relation",
          ),
        ));

    final emergencyInfo = Container(
        child: ListView(
      shrinkWrap: true,
      children: <Widget>[heading3, emergencyName, phone2, relation],
    ));
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
          child: Center(
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.only(left: 24.0, right: 24.0),
          children: <Widget>[
            personalInfo,
            contactInfo,
            emergencyInfo,
          ],
        ),
      )),
    );
  }
}
