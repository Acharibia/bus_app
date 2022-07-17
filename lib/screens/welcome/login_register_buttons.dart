import 'package:bus_app/components/rounded_button.dart';
import 'package:bus_app/screens/signin/sign_screen.dart';
import 'package:bus_app/screens/signup/signup_screen.dart';
import 'package:flutter/material.dart';

class LoginRegisterButtons extends StatelessWidget {
  const LoginRegisterButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          const Text(
            "Welcome To Tech",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
          ),
          const SizedBox(
            height: 20,
          ),
          // another widget for rounded button & use here and other screens
          RoundedButton(
              label: "SIGN IN",
              onPressed: () {
                //Code to open sign up screen
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SignInScreen(),
                    ),
                    (route) => false); //lets check
              }),
          const SizedBox(
            height: 10,
          ),
          RoundedButton(
              label: "SIGN UP",
              onPressed: () {
                //Code to open sign in screen
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SignUpScreen(),
                    ),
                    (route) => false); //lets check
              }),
        ],
      ),
    );
  }
}
