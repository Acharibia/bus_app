import 'package:bus_app/driver/signup/welcome_driver.dart';
import 'package:bus_app/screens/welcome/welcome.dart';
import 'package:flutter/material.dart';

class Status extends StatelessWidget {
  const Status({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 200,),
            Container(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  children: [

                    Card(
                      elevation: 10,
                      child: SignUpBackground(
                        color: Colors.white
                        ,
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image(image: AssetImage("assets/images/Shuttle-Tracker_img.png",), height: 200, width: 250,),
                              Text('Are you a', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, ),),
                              SizedBox(
                                height: 10,
                              ),
                              choosePathButton(
                                buttonText('Student'),
                                () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=> WelcomeScreen()));
                                },
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              choosePathButton(
                                buttonText('Driver'),
                                () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=> WelcomeDriver()));
                                },
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
    );
  }
}

class SignUpBackground extends StatelessWidget {
  final Color color;
  final Widget child;

  const SignUpBackground({
    Key? key,
    required this.color,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20)
      ),
      width: 330,
      height: 430,
      child: child,
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
