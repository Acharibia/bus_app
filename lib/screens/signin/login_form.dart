import 'package:bus_app/components/rounded_button.dart';
import 'package:bus_app/components/showdialog.dart';
import 'package:bus_app/screens/forgot_password/forgot_password_screen.dart';
import 'package:bus_app/screens/home/home_screen.dart';
import 'package:bus_app/screens/nav/cbn.dart';
import 'package:bus_app/screens/onboarding/onboarding_screen.dart';
import 'package:bus_app/services/auth_response.dart';
import 'package:bus_app/services/authentication_service.dart';
import 'package:bus_app/services/main_model.dart';
import 'package:bus_app/utils/util.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import '../../components/social_media_options.dart';
import '../signup/signup_screen.dart';

class LoginForm extends StatefulWidget {
  LoginForm({Key? key}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController emailEditingController = TextEditingController();

  final TextEditingController pwdEditingController = TextEditingController();

  AutovalidateMode _autoValidate = AutovalidateMode.disabled;

  FocusNode _emailFocusNode = FocusNode();
  FocusNode _passwordFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(children: [
        Text(
          'Sign In',
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 30,
        ),
        Form(
            autovalidateMode: _autoValidate,
            key: _formKey,
            child: Column(children: [
              TextFormField(
                focusNode: _emailFocusNode,
                autovalidateMode: _emailFocusNode.hasFocus
                    ? AutovalidateMode.onUserInteraction
                    : AutovalidateMode.disabled,
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
              TextFormField(
                focusNode: _passwordFocusNode,
                autovalidateMode: _passwordFocusNode.hasFocus
                    ? AutovalidateMode.onUserInteraction
                    : AutovalidateMode.disabled,
                controller: pwdEditingController,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: "Password",
                  prefixIcon: Icon(
                    Icons.key,
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
                    return "Password is required";
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: () {
                      //open forgot password screen here
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ForgotPasswordScreen(),
                          ),
                          (route) => false); //lets check
                    },
                    child: const Text("Forgot Password"),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              _buildSignInButton()
            ])),
        const SizedBox(
          height: 10,
        ),
        const SocialMediaOptions(),
        const SizedBox(
          height: 30,
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
        )
      ]),
    );
  }

  Widget _buildSignInButton() {
    return ScopedModelDescendant<MainModel>(
        builder: (BuildContext ctx, Widget? child, MainModel model) {
      return RoundedButton(
          label: "LOGIN",
          onPressed: () {
            onSubmit(model.signInWithEmail);
            if (model.isLoading) {
              showLoadingIndicator(context, 'Signing in...');
            }
          });
    });
  }

  void onSubmit(Function signInWithEmail) {
    if (_formKey.currentState!.validate()) {
      //call sign in method of firebase & open home screen on successful login
      _formKey.currentState!.save();

      signInWithEmail(
              email: emailEditingController.text,
              password: pwdEditingController.text)
          .then((authResponse) {
        if (authResponse.authStatus == AuthStatus.success) {
           Navigator.of(context).pop();
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => const Bottom(),
              ),
              (route) => false); //lets check
        } else {
          //show error message from snackbar
           Navigator.of(context).pop();
          Util.showErrorMessage(context, authResponse.message);
        }
      });
    } else {
      setState(() => _autoValidate = AutovalidateMode.onUserInteraction);
    }
  }
}
