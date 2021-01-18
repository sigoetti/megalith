import 'package:flutter/material.dart';
import 'package:megalith/detailPage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MegalithApp());
}


class MegalithApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MegalithApp',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'MegalithApp Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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

class Megalith extends StatelessWidget {
  final DocumentSnapshot snapshot;

  Megalith(this.snapshot);

  Map<String, dynamic> get megalith {
    return snapshot.data();
  }

  Widget get title {
    return Text("${megalith['location']}");
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: title,
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => DetailPage()));
      },
    );
  }
}
