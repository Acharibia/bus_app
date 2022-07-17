import 'package:bus_app/components/mobile_layout.dart';
import 'package:bus_app/components/responsive_layout.dart';
import 'package:bus_app/components/web_layout.dart';
import 'package:flutter/material.dart';

import 'forgot_password_form.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Login(
        webChild: WebLayout(
            imageWidget: Image.asset("assets/images/padlock.png", width: 150,),
            dataWidget: ForgotPasswordForm()
        ),
        mobileChild: MobileLayout(imageWidget:  Image.asset("assets/images/padlock.png", width: 75,), dataWidget: ForgotPasswordForm(),
          
        ));
  }
}
