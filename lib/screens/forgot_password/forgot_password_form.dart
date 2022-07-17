import 'package:bus_app/components/rounded_button.dart';
import 'package:bus_app/services/auth_response.dart';
import 'package:bus_app/services/authentication_service.dart';
import 'package:bus_app/utils/util.dart';
import 'package:flutter/material.dart';

import '../signin/sign_screen.dart';
import '../signup/signup_screen.dart';

class ForgotPasswordForm extends StatelessWidget {
  ForgotPasswordForm({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();
  final TextEditingController nameEditingController = TextEditingController();
  final TextEditingController emailEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(children: [
        Text(
          'Forgot Password',
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 30,
        ),
        Form(key: _formKey, child: Column(children: [
          TextFormField(
            controller: emailEditingController,
            keyboardType: TextInputType.emailAddress,
            autofocus: false,
            enableSuggestions: false,
            decoration: InputDecoration(
              hintText: "Email",
              prefixIcon: Icon(
                Icons.email,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(40),
                borderSide:
                const BorderSide(width: 0, style: BorderStyle.none),
              ),
              filled: true,
              isDense: true,
              contentPadding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
              fillColor: Colors.grey[300],
            ),
            //apply validation
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Please enter email";
              }
              return null;
            },
          ),
          const SizedBox(
            height: 10,
          ),
          RoundedButton(label: "RESET PASSWORD", onPressed: (){
            // we will call firebase reset password by email method
            AuthenticationService().resetPassword(email: emailEditingController.text)
                .then((authResponse){
                  if (authResponse.authStatus == AuthStatus.success) {
                    Util.showSuccessMessage(context, "Email has been sent to reset password, please check your mail id");
                  }else {
                    Util.showErrorMessage(context, authResponse.message);
                  }
            });
          })
        ])),
        const SizedBox(
          height: 30,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            const Text("Already have an account? "),
            InkWell(
              onTap: (){
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SignInScreen(),
                    ),
                        (route) => false); //lets check
              },
              child: Text("Sign In", style: TextStyle(color: Colors.blue),),
            )
          ],),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Don't have an account? "),
            InkWell(
              onTap: () {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SignUpScreen(),
                    ),
                        (route) => false); //lets check
              },
              child: Text(
                "Sign Up",
                style: TextStyle(color: Colors.blue),
              ),
            )
          ],
        ),
      ]),
    );
  }
}
