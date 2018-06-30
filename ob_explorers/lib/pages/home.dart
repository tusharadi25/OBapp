import 'package:flutter/material.dart';
import 'package:ob_explorers/utils/ob.dart';
import 'package:ob_explorers/utils/cards.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomeScreen extends StatelessWidget {
  final String name = ob.name;
  @override
    Widget build(BuildContext context) {
      Firestore.instance.collection('Notify').document('${U.user.email}').setData({
        'Token': '${U.token}',
      });
      return  MyHomePage(title: ob.name);
    }
}
