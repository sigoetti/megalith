import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
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
                  'title',
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
                  child: Text('Standort'),
                ),
                Icon(Icons.location_on),
              ],
            ),
            Container(
              padding: EdgeInsets.fromLTRB(0, 20.0, 0, 20.0),
              child: Text(
                'description aaaaaaaaaaaaaaaaaaa aaaaaaaaaaaaaaaaa aaaaaaaaaaaaaaaaaaaaaaa',
              ),
            ),

          ],
        ),
      ),
    ]));
  }
}
