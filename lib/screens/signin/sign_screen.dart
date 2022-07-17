import 'package:bus_app/components/mobile_layout.dart';
import 'package:bus_app/components/responsive_layout.dart';
import 'package:bus_app/components/web_layout.dart';
import 'package:flutter/material.dart';

import 'login_form.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Login(
      webChild: WebLayout(
        imageWidget: Image.asset(
          "assets/images/refer.png",
          width: 150,
        ),
        dataWidget: LoginForm(), //lets create widget for login form & use here
      ),
      mobileChild: MobileLayout(
        imageWidget: Image.asset(
          "assets/images/refer.png",
          width: 75,
        ),
        dataWidget: LoginForm(),
      ),
    );
  }
}
