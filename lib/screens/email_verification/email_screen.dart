import 'package:bus_app/components/mobile_layout.dart';
import 'package:bus_app/components/responsive_layout.dart';
import 'package:bus_app/components/web_layout.dart';
import 'package:bus_app/screens/email_verification/email_verification.dart';
import 'package:flutter/material.dart';

class EmailVerificationScreen extends StatelessWidget {
  const EmailVerificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Login(
        webChild: WebLayout(
            imageWidget: Image.asset("assets/images/padlock.png", width: 150,),
            dataWidget: VerifyEmailForm()
        ),
        mobileChild: MobileLayout(imageWidget:  Image.asset("assets/images/padlock.png", width: 75,), dataWidget: VerifyEmailForm(),
          
        ));
  }
}
