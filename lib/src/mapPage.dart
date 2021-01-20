import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';

class MapPage extends StatelessWidget {
  final GeoPoint gps;

  MapPage({
    @required this.gps
  });

  Widget build(BuildContext context) {
    return new FlutterMap(
      options: new MapOptions(
        center: new LatLng(gps.latitude, gps.longitude),
        zoom: 15.0,
      ),
      layers: [
        new TileLayerOptions(
            urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
            subdomains: ['a', 'b', 'c']
        ),
        new MarkerLayerOptions(
          markers: [
            new Marker(
              width: 80.0,
              height: 80.0,
              point: new LatLng(gps.latitude, gps.longitude),
              builder: (ctx) =>
              new Container(
                child: Icon(Icons.location_on, color: Colors.red,),
              ),
            ),
          ],
        ),
      ],
    );
  }

}
