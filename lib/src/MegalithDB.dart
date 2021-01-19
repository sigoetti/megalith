import 'package:flutter/material.dart';
import 'package:megalith/src/detailPage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Megalith extends StatelessWidget {
  final DocumentSnapshot snapshot;

  Megalith(this.snapshot);

  Map<String, dynamic> get megalith {
    return snapshot.data();
  }

  Widget get location {
    return Text("${megalith['location']}");
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: location,
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => DetailPage()));
      },
    );
  }
}
