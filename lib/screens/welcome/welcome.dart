import 'package:bus_app/components/mobile_layout.dart';
import 'package:bus_app/components/responsive_layout.dart';
import 'package:bus_app/components/web_layout.dart';
import 'package:bus_app/screens/welcome/login_register_buttons.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Login(
        webChild: WebLayout(
          imageWidget: Image.asset(
            'assets/images/Shuttle-Tracker_img.png',
            width: 250,
            height: 250,
          ),
          dataWidget:
              LoginRegisterButtons(), // define separate widgets for login & signup buttons
        ),
        mobileChild: MobileLayout(
            imageWidget: Image.asset(
              'assets/images/Shuttle-Tracker_img.png', // configure assets in pubspec.yaml file
              height: 150,
            ),
            dataWidget: const LoginRegisterButtons(),),);
  }
}
