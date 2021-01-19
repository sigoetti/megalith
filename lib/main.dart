import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:megalith/src/listPage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MegalithApp());
}

class MegalithApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MegalithApp',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ListPage(title: 'MegalithApp Home Page'),
    );
  }
}