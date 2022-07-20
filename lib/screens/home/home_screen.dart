import 'dart:async';

import 'package:bus_app/components/my_map.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:location/location.dart' as loc;
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../components/my_drawer_header.dart';
import '../../services/authentication_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  loc.Location location = loc.Location();
  StreamSubscription<loc.LocationData>? _locationSubscription;
  @override
  void initState() {
    super.initState();
    _requestPermission();
    location.changeSettings(interval: 300, accuracy: loc.LocationAccuracy.high);
    location.enableBackgroundMode(enable: true);
  }

  var currentPage = DrawerSections.account;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: AppBar(
          backgroundColor: Colors.green,
          title: Text("Shuttle Tracker"),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.notifications),
            )
          ],
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(20))),
          elevation: 5,
        ),
      ),
      drawer: Drawer(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                MyHeaderDrawer(),
                MyDrawerList(),
              ],
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          TextButton(
              onPressed: () {
                _getLocation();
              },
              child: Text(
                "add my location",
              )),
          TextButton(
              onPressed: () {
                _listenLocation();
              },
              child: Text(
                "enable live location",
              )),
          TextButton(
              onPressed: () {
                _stopListening();
              },
              child: Text(
                "stop live location",
              )),
          Expanded(
            child: StreamBuilder(
              stream:
                  FirebaseFirestore.instance.collection("location").snapshots(),
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (!snapshot.hasData) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return ListView.builder(
                    itemCount: snapshot.data?.docs.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Card(
                            child: ListTile(
                              title: Text(snapshot.data!.docs[index]['name']
                                  .toString()),
                              subtitle: Row(
                                children: [
                                  Text(
                                    snapshot.data!.docs[index]['latitude']
                                        .toString(),
                                  ),
                                  Text(
                                    snapshot.data!.docs[index]['longitude']
                                        .toString(),
                                  )
                                ],
                              ),
                              trailing: IconButton(
                                  onPressed: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) => MyMap(snapshot
                                                .data!.docs[index].id)));
                                  },
                                  icon: Icon(Icons.directions)),
                            ),
                          ),
                          Card(
                            child: ListTile(
                              title: Text(snapshot.data!.docs[index]['name']
                                  .toString()),
                              subtitle: Row(
                                children: [
                                  Text(
                                    snapshot.data!.docs[index]['latitude']
                                        .toString(),
                                  ),
                                  Text(
                                    snapshot.data!.docs[index]['longitude']
                                        .toString(),
                                  )
                                ],
                              ),
                              trailing: IconButton(
                                  onPressed: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) => MyMap(snapshot
                                                .data!.docs[index].id)));
                                  },
                                  icon: Icon(Icons.directions)),
                            ),
                          ),
                        ],
                      );
                    });
              },
            ),
          ),
        ],
      ),
    );
  }

  _getLocation() async {
    try {
      final loc.LocationData _locationResult = await location.getLocation();
      FirebaseFirestore.instance.collection('location').doc("user1").set({
        "latitude": _locationResult.latitude,
        "longitude": _locationResult.longitude,
        "name":   Text(
          AuthenticationService().getUserName() ?? "",
          style: const TextStyle(
              fontSize: 30, color: Colors.black54),
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
        "name":   Text(
          AuthenticationService().getUserName() ?? "",
          style: const TextStyle(
              fontSize: 30, color: Colors.black54),
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

  _requestPermission() async {
    var status = await Permission.location.request();
    if (status.isGranted) {
      print("done");
    } else if (status.isDenied) {
      _requestPermission();
    } else if (status.isPermanentlyDenied) {
      openAppSettings();
    }
  }

  Widget MyDrawerList() {
    return Container(
      padding: EdgeInsets.only(top: 15),
      child: Column(
        children: [
          menuItems(1, "My account", Icons.person_outline,
              currentPage == DrawerSections.account ? true : false),
          menuItems(2, "Contacts", Icons.people_alt_outlined,
              currentPage == DrawerSections.contacts ? true : false),
          menuItems(3, "Events", Icons.event,
              currentPage == DrawerSections.events ? true : false),
          menuItems(4, "Help", Icons.help,
              currentPage == DrawerSections.help ? true : false),
          Divider(),
          menuItems(5, "Settings", Icons.settings_outlined,
              currentPage == DrawerSections.settings ? true : false),
          menuItems(6, "Notifications", Icons.notifications_outlined,
              currentPage == DrawerSections.notifications ? true : false),
          Divider(),
          menuItems(7, "Privacy policy", Icons.privacy_tip_outlined,
              currentPage == DrawerSections.privacy_policy ? true : false),
          menuItems(1, "Send feedback", Icons.feedback_outlined,
              currentPage == DrawerSections.send_feedback ? true : false),
        ],
      ),
    );
  }

  Widget menuItems(int id, String title, IconData icon, bool selected) {
    return Material(
        color: selected ? Colors.grey.shade300 : Colors.transparent,
        child: InkWell(
          onTap: () {
            Navigator.pop(context);
            if (id == 1) {
              currentPage = DrawerSections.account;
            }
            if (id == 2) {
              currentPage = DrawerSections.contacts;
            }
            if (id == 3) {
              currentPage = DrawerSections.events;
            }
            if (id == 4) {
              currentPage = DrawerSections.help;
            }
            if (id == 5) {
              currentPage = DrawerSections.settings;
            }
            if (id == 6) {
              currentPage = DrawerSections.notifications;
            }
            if (id == 7) {
              currentPage = DrawerSections.privacy_policy;
            }
            if (id == 8) {
              currentPage = DrawerSections.send_feedback;
            }
          },
          child: Padding(
            padding: EdgeInsets.all(15),
            child: Row(
              children: [
                Expanded(
                  child: Icon(
                    icon,
                    size: 20,
                    color: Colors.black,
                  ),
                ),
                Expanded(
                    flex: 3,
                    child: Text(
                      title,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                      ),
                    ))
              ],
            ),
          ),
        ));
  }
}

enum DrawerSections {
  account,
  contacts,
  events,
  help,
  settings,
  notifications,
  privacy_policy,
  send_feedback
}
