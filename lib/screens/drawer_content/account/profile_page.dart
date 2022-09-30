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

            ],
          ),
        )


        );

  }
}
