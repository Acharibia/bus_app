import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:location/location.dart' as loc;
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../services/authentication_service.dart';

class DriverHomeScreen extends StatefulWidget {
  const DriverHomeScreen({Key? key}) : super(key: key);

  @override
  State<DriverHomeScreen> createState() => _DriverHomeScreenState();
}

class _DriverHomeScreenState extends State<DriverHomeScreen> {
  loc.Location location = loc.Location();
  StreamSubscription<loc.LocationData>? _locationSubscription;
  @override
  void initState() {
    super.initState();
    _getLocation();
    _requestPermission();
    _listenLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: Padding(
            padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 3),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: const Icon(Icons.menu)),
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Center(
          child: Text(
            "DRIVER",
            style: TextStyle(color: Colors.black),
          ),
        ),
        iconTheme: const IconThemeData(color: Colors.black),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Center(
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: IconButton(
                      onPressed: () {}, icon: const Icon(Icons.message))),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            Container(
              width: double.infinity,
              height: 250,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: const DecorationImage(
                    image:
                        AssetImage("assets/images/Taxi driver _ nowadays.gif"),
                    fit: BoxFit.cover),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              width: 350,
              child: Card(
                elevation: 10,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 70),
                  child: Column(
                    children: [
                      const SizedBox(
                        width: 350,
                        child: Text(
                          "Hey there, please  make sure to enable your location",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 28,
                          ),
                        ),
                      ),
                      const Divider(
                        color: Colors.black12,
                        height: 20,
                        thickness: 1,
                        indent: 3,
                        endIndent: 10,
                      ),
                      Center(
                        child: Container(
                          width: 300,
                          child: const Text(
                              "To inform users about bus status click on the buttons below"),
                        ),
                      ),
                      const Divider(
                        color: Colors.black12,
                        height: 20,
                        thickness: 1,
                        indent: 3,
                        endIndent: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            height: 50,
                            width: 100,
                            child: const Card(
                              child: Center(
                                  child: Text(
                                "FULL",
                                style: TextStyle(color: Colors.white),
                              )),
                              color: Colors.deepPurple,
                            ),
                          ),
                          Container(
                            height: 50,
                            width: 100,
                            child: Card(
                              child: Center(
                                  child: Text(
                                "NOT FULL",
                                style: TextStyle(color: Colors.white),
                              )),
                              color: Colors.deepPurple,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _requestPermission() async {
    var status = await Permission.location.request();
    if (status.isGranted) {
      location.changeSettings(
          interval: 300, accuracy: loc.LocationAccuracy.high);
      location.enableBackgroundMode(enable: true);
      print("done");
    } else if (status.isDenied) {
      _requestPermission();
    } else if (status.isPermanentlyDenied) {
      openAppSettings();
    }
  }

  _getLocation() async {
    try {
      final loc.LocationData _locationResult = await location.getLocation();
      FirebaseFirestore.instance.collection('location').doc("user1").set({
        "latitude": _locationResult.latitude,
        "longitude": _locationResult.longitude,
        "name": Text(
          AuthenticationService().getUserName() ?? "",
          style: const TextStyle(fontSize: 30, color: Colors.black54),
        ),
      }, SetOptions(merge: true));
    } catch (e) {
      print(e);
    }
  }

  Future<void> _listenLocation() async {
    _locationSubscription = location.onLocationChanged.handleError((onError) {
      print(onError);
      _locationSubscription?.cancel();
      setState(() {
        _locationSubscription = null;
      });
    }).listen((loc.LocationData currentLocation) async {
      await location.getLocation();
      FirebaseFirestore.instance.collection('location').doc("user1").set({
        "latitude": currentLocation.latitude,
        "longitude": currentLocation.longitude,
        "name": Text(
          AuthenticationService().getUserName() ?? "",
          style: const TextStyle(fontSize: 30, color: Colors.black54),
        ),
      }, SetOptions(merge: true));
    });
  }

  _stopListening() {
    _locationSubscription?.cancel();
    setState(() {
      _locationSubscription = null;
    });
  }
}
