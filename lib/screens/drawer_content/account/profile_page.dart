
import 'package:bus_app/screens/home/home_screen.dart';
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
          title: Text(
            'My Account',
            style: TextStyle(color: Colors.black54),
          ),
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
            icon: Icon(Icons.arrow_back),
            color: Colors.black54,
          ),
        ),
        body: Column(
          children: [
            Center(child: ClipOval(
              child: Material(
                color: Colors.transparent,
                child: Ink.image(
                  image: AssetImage('assets/images/user.png'),
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
                "myemail@gmail.com",
                style: const TextStyle(fontSize: 15, color: Colors.black54),
              ),
            ),
            SizedBox(height: 9,),
            Container(height: 50,
              width: 370,
              decoration: BoxDecoration(
                color: Colors.blue.shade50,
                borderRadius: BorderRadius.circular(20),

              ),
              child: ListTile(
                leading: Icon(Icons.privacy_tip_outlined),
                title: Text("Privacy"),
                trailing: Icon(Icons.arrow_forward_ios),
              ),
            ),

            SizedBox(height: 20,),
            Container(height: 50,
              width: 370,
              decoration: BoxDecoration(
                color: Colors.blue.shade50,
                borderRadius: BorderRadius.circular(20),

              ),
              child: ListTile(
                leading: Icon(Icons.help_outline),
                title: Text("Help & Support"),
                trailing: Icon(Icons.arrow_forward_ios),
              ),
            ),

            SizedBox(height: 20,),

            Container(height: 50,
              width: 370,
              decoration: BoxDecoration(
                color: Colors.blue.shade50,
                borderRadius: BorderRadius.circular(20),

              ),
              child: ListTile(
                leading: Icon(Icons.settings_outlined),
                title: Text("Settings"),
                trailing: Icon(Icons.arrow_forward_ios),
              ),
            ),

            SizedBox(height: 20,),
            Container(height: 50,
              width: 370,
              decoration: BoxDecoration(
                color: Colors.blue.shade50,
                borderRadius: BorderRadius.circular(20),

              ),
              child: Center(
                child: ListTile(
                  leading: Icon(Icons.person_add_alt),
                  title: Text("Invite Friends"),
                  trailing: Icon(Icons.arrow_forward_ios),
                ),
              ),
            ),

            SizedBox(height: 20,),
            Container(height: 50,
              width: 370,
              decoration: BoxDecoration(
                color: Colors.blue.shade50,
                borderRadius: BorderRadius.circular(20),

              ),
              child: Center(
                child: ListTile(
                  leading: Icon(Icons.history),
                  title: Text("Ride History"),
                  trailing: Icon(Icons.arrow_forward_ios),
                ),
              ),
            ),
            SizedBox(height: 20,),
            Container(height: 50,
              width: 370,
              decoration: BoxDecoration(
                color: Colors.blue.shade50,
                borderRadius: BorderRadius.circular(20),

              ),
              child: Center(
                child: ListTile(
                  leading: Icon(Icons.logout_outlined),
                  title: Text("Logout"),
                  trailing: Icon(Icons.arrow_forward_ios),
                ),
              ),
            ),
          ],
        )


        );

  }
}
