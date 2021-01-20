import 'package:flutter/material.dart';
import 'detailPage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Megalith extends StatelessWidget {
  final DocumentSnapshot snapshot;

  Megalith(this.snapshot);

  Map<String, dynamic> get megalith {
    return snapshot.data();
  }

  String get location {
    return ("${megalith['location']}");
  }

  String get description {
    return ("${megalith['description']}");
  }

  String get biblio {
    return ("${megalith['biblio']}");
  }

  String get img {
    return ("${megalith['img']}");
  }

  GeoPoint get gps {
    return megalith['gps'];
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(location),
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DetailPage(
                    location: location,
                    description: description,
                    gps: gps,
                    biblio: biblio,
                    img: img)));
      },
    );
  }
}
