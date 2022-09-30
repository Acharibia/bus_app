import'package:bus_app/screens/home/home_screen.dart';
import 'package:bus_app/services/authentication_service.dart';
import 'package:flutter/material.dart';


class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {


    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.white,
          leading: IconButton(
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
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Center(child: ClipOval(
                child: Material(
                  color: Colors.transparent,
                  child: Ink.image(
                    
                    // ignore: unnecessary_null_comparison
                    image: NetworkImage(AuthenticationService().getUserPhotoUrl().toString()) == null ? AssetImage('assets/images/user.png') : AssetImage('assets/images/user.png') ,
                    fit: BoxFit.cover,
                    width: 128,
                    height: 128,
                  ),
                ),
              ),
              ), 
          
              Center(
                child: Text(
                  AuthenticationService().getUserName() ?? "",
                  style: const TextStyle(fontSize: 25, color: Colors.black54),
                ),
              ),
              Center(
                child: Text(
                   AuthenticationService().getUserEmail().toString(),
                  style: const TextStyle(fontSize: 15, color: Colors.black54),
                ),
              ),
              Divider(
                color: Colors.black12,
                height: 20,
                thickness: 1,
                indent: 10,
                endIndent: 10,
              ),

              SizedBox(height: 5,),
              ListTile(
                leading: Icon(Icons.privacy_tip_outlined),
                title: Text("Privacy"),
                trailing: Icon(Icons.arrow_forward_ios),
              ),
              Divider(
                color: Colors.black12,
                height: 20,
                thickness: 1,
                indent: 10,
                endIndent: 10,
              ),

              SizedBox(height: 5,),
              ListTile(
                leading: Icon(Icons.help_outline),
                title: Text("Help & Support"),
                trailing: Icon(Icons.arrow_forward_ios),
              ),
              Divider(
                color: Colors.black12,
                height: 20,
                thickness: 1,
                indent: 10,
                endIndent: 10,
              ),

              SizedBox(height: 5,),

              ListTile(
                leading: Icon(Icons.settings_outlined),
                title: Text("Settings"),
                trailing: Icon(Icons.arrow_forward_ios),
              ),
              Divider(
                color: Colors.black12,
                height: 20,
                thickness: 1,
                indent: 10,
                endIndent: 10,
              ),
              SizedBox(height: 5,),
              Center(
                child: ListTile(
                  leading: Icon(Icons.person_add_alt),
                  title: Text("Invite Friends"),
                  trailing: Icon(Icons.arrow_forward_ios),
                ),
              ),
              Divider(
                color: Colors.black12,
                height: 20,
                thickness: 1,
                indent: 10,
                endIndent: 10,
              ),

              SizedBox(height: 5,),
              Center(
                child: ListTile(
                  leading: Icon(Icons.history),
                  title: Text("Ride History"),
                  trailing: Icon(Icons.arrow_forward_ios),
                ),
              ),
              SizedBox(height: 5,),
              Center(
                child: ListTile(
                  leading: Icon(Icons.logout_outlined),
                  title: Text("Logout"),
                  trailing: Icon(Icons.arrow_forward_ios),
                ),
              ),
              Divider(
                color: Colors.black12,
                height: 20,
                thickness: 1,
                indent: 10,
                endIndent: 10,
              ),

            ],
          ),
        )


        );

  }
}
