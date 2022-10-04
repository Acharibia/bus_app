import 'package:bus_app/driver/signup/driver_signup.dart';
import 'package:bus_app/screens/welcome/welcome.dart';
import 'package:flutter/material.dart';

class WelcomeDriver extends StatelessWidget {
  const WelcomeDriver({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage("assets/images/background1.jpg"),
              fit: BoxFit.cover
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(height: 200,),
              Center(
                child: Container(
                  child: Column(
                    children: [

                      Container(
                        height: 400,
                        width: 300,
                        child: Card(
                    elevation: 12,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),),
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image(image: AssetImage("assets/images/Shuttle-Tracker_img.png",), height: 200, width: 250,),
                                Text('Welcome', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, ),),
                                SizedBox(
                                  height: 10,
                                ),
                                choosePathButton(
                                  buttonText('Sign Up'),
                                      () {
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=> DriverSignUpForm()));
                                  },
                                ),
                                SizedBox(
                                  height: 10,
                                ),

                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

ElevatedButton choosePathButton(Text textNorm20, pressed) {
  return ElevatedButton(
    onPressed: pressed,
    child: textNorm20,
    style: ButtonStyle(
      shape: MaterialStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      minimumSize: MaterialStateProperty.all(
        Size(
          250,
          43,
        ),
      ),
      //padding: MaterialStateProperty.all(
      //EdgeInsets.only(top: 15, bottom: 15)),
      backgroundColor: MaterialStateProperty.all(Colors.green),
    ),
  );
}

Text buttonText(String text) {
  return Text(
    text,
    style: TextStyle(
      fontFamily: 'GothamRounded',
      fontSize: 20,
      fontWeight: FontWeight.w400,
      color: Colors.white,
    ),
  );
}
