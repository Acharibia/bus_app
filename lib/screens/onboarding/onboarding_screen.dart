import 'package:bus_app/components/onboarding_page.dart';
import 'package:flutter/material.dart';


class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  PageController controller = PageController(initialPage: 0);
  bool onLastPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: controller,
        children: [
          OnBoardingPage(
            image: Image.asset(
                "assets/images/business-3d-young-women-standing.png"),
            title: "Welcome",

            description:
                "This App is meant to help you locate the school shuttle at all times",
            noOfScreens: 3,
            onNextPressed: changeScreen,
            currentScreenNo: 0,
          ),
          OnBoardingPage(
            image: Image.asset(
                "assets/images/business-3d-black-man-in-glasses-standing-and-typing-on-a-phone.png"),
            title: "For Better Functionality ",
            description: "1) You need to have a good internet connection 2) Make sure your location is on 3) You have to be in Tech Campus",
            noOfScreens: 3,
            onNextPressed: changeScreen,
            currentScreenNo: 1,
          ),
          OnBoardingPage(
            image: Image.asset(
                "assets/images/business-3d-man-in-formalwear-walking-with-phone.png"),
            title: "Lets Go!!!",
            description: "Don't forget to turn on your location on your device",
            noOfScreens: 3,
            onNextPressed: changeScreen,
            currentScreenNo: 2,
          )
        ],
      ),
    );
  }

  void changeScreen(int nextScreenNo) {
    controller.animateToPage(nextScreenNo,
        duration: const Duration(microseconds: 500), curve: Curves.easeIn);
  }
}