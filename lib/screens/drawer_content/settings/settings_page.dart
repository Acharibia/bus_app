import 'package:bus_app/screens/drawer_content/settings/change-password.dart';
import 'package:bus_app/screens/drawer_content/settings/edit-profile.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../home/home_screen.dart';

class SettingsPage extends StatefulWidget {
  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    bool _value = true;
    return Scaffold(
      backgroundColor: Colors.white,

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

                  color: Colors.black54,
                ),
              Container(
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                  child: Text("Settings", style: TextStyle(color: Colors.black54, fontSize: 40, fontWeight: FontWeight.bold),)),

              SizedBox(height: 20,),
              Container(height: 50,
                width: 370,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
          
                ),


                child: ListTile(
                  leading: Icon(Icons.person_outline, color: Colors.black,),
                  title: Text("Account",style: TextStyle(color: Colors.black, fontSize: 17),),
                ),
              ),
                Divider(
                  color: Colors.black12,
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
                  child: GestureDetector(
                    child: ListTile(
                      title: Text("Edit Profile",style: TextStyle(color: Colors.black54, fontSize: 15),),
                      trailing: Icon(Icons.arrow_forward_ios, color: Colors.black54, size: 17,),
                    ),
                    onTap:() {
                    //open forgot password screen here
                    Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const EditProfile(),
                    ),
                        (route) => false); //lets check
        },
                  ),
                ),
                Divider(
                  color: Colors.black12,
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
                  child: GestureDetector(

                    child: ListTile(
                      title: Text("Change Password",style: TextStyle(color: Colors.black54, fontSize: 15),),
                      trailing: Icon(Icons.arrow_forward_ios, color: Colors.black54, size: 17,),
                    ),
                    onTap:() {
                      //open forgot password screen here
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ChangePassword(),
                          ),
                              (route) => false); //lets check
                    },
                  ),
                ),
                Divider(
                  color: Colors.black12,
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
                    title: Text("Privacy",style: TextStyle(color: Colors.black54, fontSize: 15),),
                    trailing: Icon(Icons.arrow_forward_ios, color: Colors.black54, size: 17,),
                  ),
                ),
                Divider(
                  color: Colors.black12,
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
                    leading: Icon(Icons.notifications_outlined, color: Colors.black,),
                    title: Text("Notification",style: TextStyle(color: Colors.black, fontSize: 17),),
                  ),
                ),
                Divider(
                  color: Colors.black12,
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
                    title: Text("Notification",style: TextStyle(color: Colors.black54, fontSize: 17),),
                    trailing: Switch(
                      value: _value,
                      onChanged: (value) {
                        setState(() {
                          _value = value;
                        });
                      },
                      activeColor: Colors.blue,
                      activeTrackColor: Colors.black12,
                      inactiveTrackColor: Colors.red[100],
                      inactiveThumbColor: Colors.white24,
                      dragStartBehavior: DragStartBehavior.start,
                    ),
                  ),
                ),
                Divider(
                  color: Colors.black12,
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
                    title: Text("App Notification",style: TextStyle(color: Colors.black54, fontSize: 15),),
                    trailing: Switch(
                      value: _value,
                      onChanged: (value) {
                        setState(() {

                          _value = value;
                        });
                      },
                      activeColor: Colors.blue,
                      activeTrackColor: Colors.black12,
                      inactiveTrackColor: Colors.red[100],
                      inactiveThumbColor: Colors.white24,
                      dragStartBehavior: DragStartBehavior.start,
                    ),
                  ),
                ),
                Divider(
                  color: Colors.black12,
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
                    leading: Icon(Icons.more_outlined, color: Colors.black,),
                    title: Text("More",style: TextStyle(color: Colors.black, fontSize: 17),),
                  ),
                ),
                Divider(
                  color: Colors.black12,
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
                    title: Text("Language",style: TextStyle(color: Colors.black54, fontSize: 17),),
                    trailing: Icon(Icons.arrow_forward_ios, color: Colors.black54, size: 17,),
                  ),
                ),
                Divider(
                  color: Colors.black12,
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
                    title: Text("Country",style: TextStyle(color: Colors.black54, fontSize: 17),),
                    trailing: Icon(Icons.arrow_forward_ios, color: Colors.black54, size: 17,),
                  ),
                ),
                Divider(
                  color: Colors.black12,
                  height: 20,
                  thickness: 1,
                  indent: 10,
                  endIndent: 10,
                ),

            ],),
          ),
        ),
      ),
    );
  }
}