import 'package:bus_app/components/mobile_layout.dart';
import 'package:bus_app/components/web_layout.dart';
import 'package:bus_app/screens/signup/signup_form.dart';
import 'package:flutter/material.dart';
import 'package:bus_app/components/responsive_layout.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Login(
        webChild: WebLayout(
          imageWidget: Image.asset(
            'assets/images/add-user.png',
            width: 150,
          ),
          dataWidget: SignUpForm(), //define widget for sign up form
        ),
        mobileChild: MobileLayout(
          imageWidget: Image.asset(
            'assets/images/add-user.png',
            width: 75,
          ),
          dataWidget: SignUpForm(),
        ));
  }
}
