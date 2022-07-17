import 'dart:async';

import 'package:bus_app/components/my_map.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:location/location.dart' as loc;
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  loc.Location location = loc.Location();
  StreamSubscription<loc.LocationData>? _locationSubscription;
  @override
  void initState(){
    super.initState();
    _requestPermission();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text("live location tracker" ,),),),
      body: Column(
        children: [
          TextButton(onPressed: (){
            _getLocation();
          }, child:Text("add my location" ,)),
          TextButton(onPressed: (){
            _listenLocation();
          }, child: Text("enable live location" ,)),
          TextButton(onPressed: (){
            _stopListening();
          }, child:Text("stop live location" ,)),

          Expanded(

           child: StreamBuilder(
            stream: FirebaseFirestore.instance.collection("location").snapshots(),

              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot){
              if (!snapshot.hasData) {
                return Center(child: CircularProgressIndicator(),);
              }  
              return ListView.builder(
                  itemCount: snapshot.data?.docs.length,
                  itemBuilder: (context, index){
                    return ListTile(
                      title: Text(snapshot.data!.docs[index]['name'].toString()),
                      subtitle: Row(
                        children: [
                          Text(snapshot.data!.docs[index]['latitude'].toString(),),
                          Text(snapshot.data!.docs[index]['longitude'].toString(),)
                        ],
                      ),
                      trailing: IconButton(onPressed:(){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => MyMap(snapshot.data!.docs[index].id)));
                      }, icon: Icon(Icons.directions)),
                    );

              }

              );

    },),),
        ],
      ),
    );
  }
  _getLocation() async{
    try{
      final loc.LocationData _locationResult = await location.getLocation();
      FirebaseFirestore.instance.collection('location').doc("user1").set(
          {
            "latitude": _locationResult.latitude,
            "longitude": _locationResult.longitude,
            "name": "John"
      }, SetOptions(merge: true)
      );
    }catch(e){
      print(e);
    }

  }
  Future<void> _listenLocation()async{
    _locationSubscription = location.onLocationChanged.handleError((onError){
      print(onError);
      _locationSubscription?.cancel();
      setState((){
        _locationSubscription = null;
      });
    }).listen((loc.LocationData currentLocation)async {
      await location.getLocation();
      FirebaseFirestore.instance.collection('location').doc("user1").set(
          {
            "latitude": currentLocation.latitude,
            "longitude": currentLocation.longitude,
            "name": "John"
          },SetOptions(merge: true));

    });
  }
  _stopListening(){
    _locationSubscription?.cancel();
    setState((){
      _locationSubscription= null;
    });
  }
  _requestPermission() async{
    var status = await Permission.location.request();
    if (status.isGranted) {
      print("done");
    }  else if (status.isDenied) {
        _requestPermission();
    }else if(status.isPermanentlyDenied){
      openAppSettings();
    }
  }
}

