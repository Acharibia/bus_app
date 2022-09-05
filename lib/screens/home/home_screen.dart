import 'dart:async';
import 'package:bus_app/components/drawer_custom_widget.dart';
import 'package:bus_app/components/drawer_list_view.dart';
import 'package:bus_app/components/my_map.dart';
import 'package:bus_app/components/my_second_map.dart';
import 'package:bus_app/components/neu_button.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:location/location.dart' as loc;
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../components/my_drawer_header.dart';
import '../../services/authentication_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key, this.onTap}) : super(key: key);
  final onTap;

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
  }
  // @override
  // void didChangeDependencies() {
  //   // TODO: implement didChangeDependencies
  //   super.didChangeDependencies();
  //    _requestPermission();
  //   // location.changeSettings(interval: 300, accuracy: loc.LocationAccuracy.high);
  //   // location.enableBackgroundMode(enable: true);
  // }

  var currentPage = DrawerSections.account;
  bool isButtonPressed = false;
  bool is2ndButtonPressed = false;
  bool is3rdButtonPressed = false;
  bool is4thButtonPressed = false;

  void buttonPressed() {
    setState(() {
      if (isButtonPressed == false) {
        isButtonPressed = true;
      } else if (isButtonPressed == true) {
        isButtonPressed = false;
      }
    });
    Navigator.of(context).push(MaterialPageRoute(
        builder: (BuildContext context) => ComercialGoogleMap()));
  }

  void button2Pressed() {
    setState(() {
      if (is2ndButtonPressed == false) {
        is2ndButtonPressed = true;
      } else if (is2ndButtonPressed == true) {
        is2ndButtonPressed = false;
      }
    });
  }

  void button3Pressed() {
    setState(() {
      if (is3rdButtonPressed == false) {
        is3rdButtonPressed = true;
      } else if (is3rdButtonPressed == true) {
        is3rdButtonPressed = false;
      }
    });
  }

  void button4Pressed() {
    setState(() {
      if (is4thButtonPressed == false) {
        is4thButtonPressed = true;
      } else if (is4thButtonPressed == true) {
        is4thButtonPressed = false;
      }
    });
  }

  var scaffoldkey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldkey,
      backgroundColor: Colors.white,
/*      endDrawer: Container(

          child: DrawerCustomWidget()),*/
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              scaffoldkey.currentState?.openDrawer();
            },
            icon: Padding(
              padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 5),
              child: Image(image: AssetImage("assets/images/menu.gif")),
            )),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Center(
          child: Text(
            "Shuttle Tracker",
            style: TextStyle(color: Colors.black),
          ),
        ),
        iconTheme: IconThemeData(color: Colors.black),
        centerTitle: true,
        actions: [
          Padding(
            padding: EdgeInsets.all(10),
            child: Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image(
                  image: AssetImage('assets/images/notification.gif'),
                ),
              ),
            ),
          ),
        ],
      ),

      drawer: DrawerCustomWidget(),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 250,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                      image: AssetImage("assets/images/bus_moving.gif"),
                      fit: BoxFit.cover),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: LinearGradient(
                      begin: Alignment.bottomRight,
                      colors: [
                        Colors.black.withOpacity(.4),
                        Colors.black.withOpacity(.2),
                      ],
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Hey There",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 35,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Container(
                        height: 50,
                        margin: EdgeInsets.symmetric(horizontal: 40),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white),
                        child: Center(
                          child: Text(
                            "Find Bus",
                            style: TextStyle(
                                color: Colors.grey.shade900,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
/*              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  padding: EdgeInsets.all(20),
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  children: [
                    NeuButton(
                      id: 1,
                      title: "Commercial",
                      onTap: buttonPressed,
                      isButtonPressed: isButtonPressed,
                    ),
                    NeuButton(
                      id: 2,
                      title: "Brunei",
                      onTap: button2Pressed,
                      isButtonPressed: is2ndButtonPressed,
                    ),
                    NeuButton(
                      id: 3,
                      title: "Bomso Gate",
                      onTap: button3Pressed,
                      isButtonPressed: is3rdButtonPressed,
                    ),
                    NeuButton(
                      id: 4,
                      title: "Medical Village",
                      onTap: button4Pressed,
                      isButtonPressed: is4thButtonPressed,
                    ),
                    NeuButton(
                      id: 5,
                      title: "",
                      onTap: buttonPressed,
                      isButtonPressed: isButtonPressed,
                    ),
                    NeuButton(
                      id: 6,
                      title: "",
                      onTap: buttonPressed,
                      isButtonPressed: isButtonPressed,
                    ),
                  ],
                ),
              ),*/ /*

*/ /*              Expanded(child: GridView.count(
                  crossAxisCount: 2,
                  padding: EdgeInsets.all(20),
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  children: _listItem
                      .map(
                        (item) => Card(
                          color: Colors.transparent,
                      elevation: 0,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                            image: AssetImage(item),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Transform.translate(
                          offset: Offset(50, -50),
                          child: Container(
                            width: 30,
                            height: 40,
                            margin: EdgeInsets.symmetric(horizontal: 65, vertical: 63),
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
                            color: Colors.white,

                            ),
                            child: Icon(Icons.card_travel, size: 15,),
                          ),
                        ),
                      ),
                    ),

                  )
                      .toList()),
              )*/ /*
*/ /*

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
*/
              Expanded(
                child: StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection("location")
                      .snapshots(),
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
                              GestureDetector(
                                  child: Container(
                                    height: 90,
                                    decoration: BoxDecoration(
                                      color: Colors.grey.shade300,
                                      borderRadius: BorderRadius.circular(15),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.blue.shade200,
                                          spreadRadius: 1,
                                          blurRadius: 8,
                                          offset: Offset(4, 4),
                                        ),
                                        BoxShadow(
                                          color: Colors.white,
                                          spreadRadius: 1,
                                          blurRadius: 8,
                                          offset: Offset(-4, -4),
                                        ),
                                      ],
                                    ),
                                    child: Card(
                                      color: Colors.grey.shade300,
                                      elevation: 0,
                                      child: Center(
                                        child: ListTile(
                                          title: Text(snapshot
                                              .data!.docs[index]['name']
                                              .toString()),
                                          trailing: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(12),
                                            child: Image(
                                                image: AssetImage(
                                                    'assets/images/bus.gif')),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  onTap: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) => MyMap(snapshot
                                                .data!.docs[index].id)));
                                  }),
                              const SizedBox(
                                height: 11,
                              ),
                              GestureDetector(
                                  child: Container(
                                    height: 90,
                                    decoration: BoxDecoration(
                                      color: Colors.grey.shade300,
                                      borderRadius: BorderRadius.circular(15),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.blue.shade200,
                                          spreadRadius: 1,
                                          blurRadius: 8,
                                          offset: Offset(4, 4),
                                        ),
                                        BoxShadow(
                                          color: Colors.white,
                                          spreadRadius: 1,
                                          blurRadius: 8,
                                          offset: Offset(-4, -4),
                                        ),
                                      ],
                                    ),
                                    child: Card(
                                      color: Colors.grey.shade300,
                                      elevation: 0,
                                      child: Center(
                                        child: ListTile(
                                          title: Text(snapshot
                                              .data!.docs[index]['name']
                                              .toString()),
                                          trailing: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 2),
                                            child: ClipRRect(
                                              child: Image(
                                                  image: AssetImage(
                                                      'assets/images/bus.gif')),
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  onTap: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) => MyMap(snapshot
                                                .data!.docs[index].id)));
                                  }),
                              const SizedBox(
                                height: 11,
                              ),
                              GestureDetector(
                                  child: Container(
                                    height: 90,
                                    decoration: BoxDecoration(
                                      color: Colors.grey.shade300,
                                      borderRadius: BorderRadius.circular(15),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.blue.shade200,
                                          spreadRadius: 1,
                                          blurRadius: 8,
                                          offset: Offset(4, 4),
                                        ),
                                        BoxShadow(
                                          color: Colors.white,
                                          spreadRadius: 1,
                                          blurRadius: 8,
                                          offset: Offset(-4, -4),
                                        ),
                                      ],
                                    ),
                                    child: Card(
                                      color: Colors.grey.shade300,
                                      elevation: 0,
                                      child: Center(
                                        child: ListTile(
                                          title: Text(snapshot
                                              .data!.docs[index]['name']
                                              .toString()),
                                          trailing: ClipRRect(
                                            child: Image(
                                                image: AssetImage(
                                                    'assets/images/bus.gif')),
                                            borderRadius:
                                                BorderRadius.circular(12),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  onTap: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) => MyMap(snapshot
                                                .data!.docs[index].id)));
                                  }),
                              const SizedBox(
                                height: 11,
                              ),
                              GestureDetector(
                                  child: Container(
                                    height: 90,
                                    decoration: BoxDecoration(
                                      color: Colors.grey.shade300,
                                      borderRadius: BorderRadius.circular(15),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.blue.shade200,
                                          spreadRadius: 1,
                                          blurRadius: 8,
                                          offset: Offset(4, 4),
                                        ),
                                        BoxShadow(
                                          color: Colors.white,
                                          spreadRadius: 1,
                                          blurRadius: 8,
                                          offset: Offset(-4, -4),
                                        ),
                                      ],
                                    ),
                                    child: Card(
                                      color: Colors.grey.shade300,
                                      elevation: 0,
                                      child: Center(
                                        child: ListTile(
                                          title: Text(snapshot
                                              .data!.docs[index]['name']
                                              .toString()),
                                          trailing: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(12),
                                            child: Image(
                                                image: AssetImage(
                                                    'assets/images/bus.gif')),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  onTap: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) => MyMap(snapshot
                                                .data!.docs[index].id)));
                                  }),
                            ],
                          );
                        });
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
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

  _requestPermission() async {
    var status = await Permission.location.request();
    if (status.isGranted) {
    location.changeSettings(interval: 300, accuracy: loc.LocationAccuracy.high);
    location.enableBackgroundMode(enable: true);
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
            setState(() {
              Navigator.pop(context);
              if (id == 1) {
                // currentPage = DrawerSections.account;

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
            });
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
