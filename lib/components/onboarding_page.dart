import 'package:bus_app/components/onboarding_button.dart';
import 'package:flutter/material.dart';
import '../services/authentication_service.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage(
      {Key? key,
      required this.image,
      required this.title,
      required this.description,
      required this.noOfScreens,
      required this.onNextPressed,
      required this.currentScreenNo})
      : super(key: key);
  final Image image;
  final String title;
  final String description;
  final int noOfScreens;
  final Function(int) onNextPressed;
  final int currentScreenNo;
  @override
  Widget build(BuildContext context) {
    bool isLastScreen = currentScreenNo >= noOfScreens -1;
    bool isFirstScreen = currentScreenNo == 0;

    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  image,
                  const SizedBox(
                    height: 20,
                  ),
                  Visibility(
                    visible: !isFirstScreen,
                    replacement: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          title,
            
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                              color: Colors.teal.shade700),
                        ),
                        SizedBox(width: 8,),
                          Text(
                              AuthenticationService().getUserName() ?? "",
                          style: const TextStyle(
                              fontSize: 30, color: Colors.black54),
                        ),
                      ],
                    ),
                    child: Text(
                      title,
            
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                          color: Colors.teal.shade700),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                   const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 45),
                    child: Text(
                      description,
                      style: TextStyle(fontSize: 20, color: Colors.teal.shade700),
                    ),
                  )
                ],
              ),
            ),
          ),
          Visibility(
            visible: !isLastScreen,
            replacement: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(

                    child: OnBoardingButton(title: "Get Started", onPressed: (){
                      openBottom(context);
                    }),
                  height: 50,
                  width: 300,
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                OnBoardingButton(
                  title: 'Skip',
                  onPressed: () {},
                ),
                Row(
                  children: [
                    for (int index = 0; index < noOfScreens; index++)
                      createProgressDots((index == currentScreenNo)? true: false)
                  ],
                ),
                OnBoardingButton(
                  title: 'Next',
                  onPressed: () {
                    onNextPressed(currentScreenNo +1);
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget createProgressDots(bool isActiveScreen) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8),
      height: isActiveScreen? 15:10,
      width: isActiveScreen? 15:10,
      decoration: BoxDecoration(
          color: isActiveScreen? Colors.green: Colors.grey,
          borderRadius: BorderRadius.all(Radius.circular(12))),
    );
  }
}
void openHomeScreen(BuildContext context){
  Navigator.pushReplacementNamed(context, "/home");
}
void openBottom(BuildContext context){
  Navigator.pushReplacementNamed(context, "/bottom_nav");
}

