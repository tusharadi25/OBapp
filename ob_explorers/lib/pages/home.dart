import 'package:flutter/material.dart';
import 'package:ob_explorers/utils/ob.dart';
import 'package:ob_explorers/utils/cards.dart';

class HomeScreen extends StatelessWidget {
  final String name = ob.name;
  @override
    Widget build(BuildContext context) {
      // TODO: implement build
      return  MyHomePage(title: ob.name);
    }
}
