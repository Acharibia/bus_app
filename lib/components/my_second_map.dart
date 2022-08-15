import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ComercialGoogleMap extends StatefulWidget {
  ComercialGoogleMap({Key? key}) : super(key: key);

  @override
  State<ComercialGoogleMap> createState() => _ComercialGoogleMapState();
}

class _ComercialGoogleMapState extends State<ComercialGoogleMap> {
  LatLng startingLocation = LatLng(6.673175, -1.565423);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
          initialCameraPosition:
              CameraPosition(target: startingLocation, zoom: 15)),
    );
  }
}

//Enable live location 
//generate random LatLng position based on your location.

