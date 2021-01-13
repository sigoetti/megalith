import 'package:flutter/material.dart';
import 'package:megalith/detailPage.dart';

void main() async {
  //WidgetsFlutterBinding.ensureInitialized();
  //await Firebase.initializeApp();
  runApp(MegalithApp());
}

final dummySnapshot = [
  {"location": "Lutry", "description": "ziemlich viiiiiiiel Text"},
  {"location": "Yverdon", "description": "ziemlich viiiiiiiel Text"},
];

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
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('Liste'),
          ),
          body: ListView.builder(
              itemCount: dummySnapshot.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text('megalith'),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => DetailPage()));
                  },
                );
              })),
    );
  }
}
