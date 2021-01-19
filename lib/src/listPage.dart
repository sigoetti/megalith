import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:megalith/src/MegalithDB.dart';


class ListPage extends StatefulWidget {
  ListPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  Query query = FirebaseFirestore.instance.collection('places');

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('Liste'),
          ),
          body: StreamBuilder<QuerySnapshot>(
            stream: query.snapshots(),
            builder: (context, stream) {
              if (stream.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              }

              if (stream.hasError) {
                return Center(child: Text(stream.error.toString()));
              }

              QuerySnapshot querySnapshot = stream.data;
              print('snapshot size ' + querySnapshot.size.toString());
              return ListView.builder(
                itemCount: querySnapshot.size,
                itemBuilder: (context, index) =>
                    Megalith(querySnapshot.docs[index]),
              );
            },
          )),
    );
  }
}
