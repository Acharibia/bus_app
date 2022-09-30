import 'package:bus_app/components/drawer_custom_widget.dart';
import 'package:bus_app/components/drawer_list_view.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../home/home_screen.dart';

class SettingsPage extends StatefulWidget {
  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    bool _value = true;
    return Scaffold(
      backgroundColor: Colors.black54,

      body: SafeArea(
        child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HomeScreen(),
                        ),
                            (route) => false); //
                  },
                  icon: Icon(Icons.arrow_back_ios),
                  color: Colors.white,
                ),
              Container(
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                  child: Text("Settings", style: TextStyle(color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold),)),
              SizedBox(height: 20,),
              Container(height: 50,
                width: 370,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
          
                ),
                child: ListTile(
                  leading: Icon(Icons.person_outline, color: Colors.white,),
                  title: Text("Account",style: TextStyle(color: Colors.white, fontSize: 17),),
                ),
              ),
                Divider(
                  color: Colors.white54,
                  height: 20,
                  thickness: 1,
                  indent: 10,
                  endIndent: 10,
                ),
                SizedBox(),
                Container(height: 50,
                  width: 370,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
          
                  ),
                  child: ListTile(
                    title: Text("Edit Profile",style: TextStyle(color: Colors.white, fontSize: 17),),
                    trailing: Icon(Icons.arrow_forward_ios, color: Colors.white, size: 17,),
                  ),
                ),
          
                Container(height: 50,
                  width: 370,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
          
                  ),
                  child: ListTile(
                    title: Text("Change Password",style: TextStyle(color: Colors.white, fontSize: 15),),
                    trailing: Icon(Icons.arrow_forward_ios, color: Colors.white, size: 17,),
                  ),
                ),
                Container(height: 50,
                  width: 370,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
          
                  ),
                  child: ListTile(
                    title: Text("Privacy",style: TextStyle(color: Colors.white, fontSize: 17),),
                    trailing: Icon(Icons.arrow_forward_ios, color: Colors.white, size: 17,),
                  ),
                ),
          
                SizedBox(height: 20,),
                Container(height: 50,
                  width: 370,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
          
                  ),
                  child: ListTile(
                    leading: Icon(Icons.notifications_outlined, color: Colors.white,),
                    title: Text("Notification",style: TextStyle(color: Colors.white, fontSize: 20),),
                  ),
                ),
                Divider(
                  color: Colors.white54,
                  height: 20,
                  thickness: 1,
                  indent: 10,
                  endIndent: 10,
                ),
                SizedBox(height: 20,),
                Container(height: 50,
                  width: 370,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
          
                  ),
                  child: ListTile(
                    title: Text("Notification",style: TextStyle(color: Colors.white, fontSize: 17),),
                    trailing: Switch(
                      value: _value,
                      onChanged: (value) {
                        setState(() {
                          _value = value;
                        });
                      },
                      activeColor: Colors.orangeAccent,
                      activeTrackColor: Colors.white54,
                      inactiveTrackColor: Colors.red[100],
                      inactiveThumbColor: Colors.white24,
                      dragStartBehavior: DragStartBehavior.start,
                    ),
                  ),
                ),
                Container(height: 50,
                  width: 370,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
          
                  ),
                  child: ListTile(
                    title: Text("App Notification",style: TextStyle(color: Colors.white, fontSize: 17),),
                    trailing: Switch(
                      value: _value,
                      onChanged: (value) {
                        setState(() {
          
                          _value = value;
                        });
                      },
                      activeColor: Colors.orangeAccent,
                      activeTrackColor: Colors.white54,
                      inactiveTrackColor: Colors.red[100],
                      inactiveThumbColor: Colors.white24,
                      dragStartBehavior: DragStartBehavior.start,
                    ),
                  ),
                ),
                Container(height: 50,
                  width: 370,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
          
                  ),
                  child: ListTile(
                    leading: Icon(Icons.more_outlined, color: Colors.white,),
                    title: Text("More",style: TextStyle(color: Colors.white, fontSize: 20),),
                  ),
                ),
                Divider(
                  color: Colors.white54,
                  height: 20,
                  thickness: 1,
                  indent: 10,
                  endIndent: 10,
                ),
                Container(height: 50,
                  width: 370,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
          
                  ),
                  child: ListTile(
                    title: Text("Language",style: TextStyle(color: Colors.white, fontSize: 17),),
                    trailing: Icon(Icons.arrow_forward_ios, color: Colors.white, size: 17,),
                  ),
                ),
                Container(height: 50,
                  width: 370,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
          
                  ),
                  child: ListTile(
                    title: Text("Country",style: TextStyle(color: Colors.white, fontSize: 17),),
                    trailing: Icon(Icons.arrow_forward_ios, color: Colors.white, size: 17,),
                  ),
                ),
            ],),
          ),
        ),
      ),
    );
  }
}