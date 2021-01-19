import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {

  final String location;
  final String description;
  final String biblio;
  final GeoPoint gps;

  DetailPage ({
    @required this.location,
    @required this.description,
    @required this.gps,
    this.biblio,
  });

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Material(
        child: Column(children: <Widget>[
      Image.network(
          'https://upload.wikimedia.org/wikipedia/commons/8/85/Merrymaidens5.jpg'),
      Padding(
        padding: EdgeInsets.all(30.0),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Text(
                  location,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30.0,
                  ),
                  textAlign: TextAlign.left,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Expanded(
                  child: Text('N: '+ gps.latitude.toString() +' / O: '+ gps.longitude.toString()),
                ),
                Icon(Icons.location_on),
              ],
            ),
            Container(
              padding: EdgeInsets.fromLTRB(0, 20.0, 0, 20.0),
              child: Text(
                description,
              ),
            ),

          ],
        ),
      ),
    ]));
  }
}
