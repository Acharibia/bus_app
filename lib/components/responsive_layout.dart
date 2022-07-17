import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  final Widget webChild;
  final Widget mobileChild;

  const Login(
      {Key? key, required this.webChild, required this.mobileChild }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage("assets/images/background1.jpg"),
          fit: BoxFit.cover
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(10),
              child: Card(
                elevation: 12,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                //using layout builder for responsive ui
                child: LayoutBuilder(
                    builder: (BuildContext context, BoxConstraints constraints){
                      Widget childWidget = mobileChild;
                      if (constraints.maxWidth > 800) {
                        childWidget = webChild;
                      }
                      return childWidget;
                    },

                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
