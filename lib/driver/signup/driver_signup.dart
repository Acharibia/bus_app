import 'package:flutter/material.dart';

import 'package:bus_app/components/rounded_button.dart';
import 'package:bus_app/components/showdialog.dart';
import 'package:bus_app/components/social_media_options.dart';

import 'package:bus_app/screens/onboarding/onboarding_screen.dart';
import 'package:bus_app/screens/signin/sign_screen.dart';
import 'package:bus_app/services/auth_response.dart';

import 'package:bus_app/services/main_model.dart';
import 'package:bus_app/utils/util.dart';

import 'package:scoped_model/scoped_model.dart';

class DriverSignUpForm extends StatefulWidget {
  DriverSignUpForm({Key? key}) : super(key: key);

  @override
  State<DriverSignUpForm> createState() => _DriverSignUpFormState();
}

class _DriverSignUpFormState extends State<DriverSignUpForm> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController nameEditingController = TextEditingController();

  final TextEditingController emailEditingController = TextEditingController();

  final TextEditingController pwdEditingController = TextEditingController();

  final TextEditingController cfrnPwdEditingController =
      TextEditingController();

  AutovalidateMode _autoValidate = AutovalidateMode.disabled;

  FocusNode _emailFocusNode = FocusNode();

  FocusNode _passwordFocusNode = FocusNode();
  FocusNode _nameFocusNode = FocusNode();
  FocusNode _confirmpasswordFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/background1.jpg"),
              fit: BoxFit.cover),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Container(

              padding: const EdgeInsets.all(20),
              child: Card(
                elevation: 12,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                //using layout bui
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Text(
                        'Sign Up',
                        style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Form(
                        autovalidateMode: _autoValidate,
                        key: _formKey,
                        child: Column(
                          children: [
                            TextFormField(
                              focusNode: _nameFocusNode,
                              autovalidateMode: _nameFocusNode.hasFocus
                                  ? AutovalidateMode.onUserInteraction
                                  : AutovalidateMode.disabled,
                              controller: nameEditingController,
                              keyboardType: TextInputType.name,
                              enableSuggestions: false,
                              decoration: InputDecoration(
                                hintText: "Name of bus",
                                prefixIcon: Icon(
                                  Icons.person,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(40),
                                  borderSide: const BorderSide(
                                      width: 0, style: BorderStyle.none),
                                ),
                                filled: true,
                                isDense: true,
                                contentPadding:
                                    const EdgeInsets.fromLTRB(10, 10, 10, 10),
                                fillColor: Colors.grey[300],
                              ),
                              //apply validation
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Please enter bus name";
                                }
                                return null;
                              },
                            ),

                            const SizedBox(
                              height: 10,
                            ),
                            _buildSignUpButton(),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const SocialMediaOptions(),
                      const SizedBox(
                        height: 30,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSignUpButton() {
    return ScopedModelDescendant<MainModel>(
        builder: (BuildContext ctx, Widget? child, MainModel model) {
      return RoundedButton(
          label: "Sign Up",
          onPressed: () {
            onSubmit(model.signUpWithEmail);
            if (model.isLoading) {
              showLoadingIndicator(context, 'Signing up...');
            }
          });
    });
  }

  void onSubmit(Function signUpWithEmail) {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      //once no error, we will create user in firebase & open home screen
      //here, but we will shortly write code for that once all screens are built.
      //now lets include signup form widget in sign up screen & test
      signUpWithEmail(
              name: nameEditingController.text,
              email: emailEditingController.text,
              password: pwdEditingController.text)
          .then((authResponse) {
        if (authResponse.authStatus == AuthStatus.success) {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => const OnBoardingScreen()),
              (route) => false); //lets check
        } else {
          //in case error, we will show error message using snackbar.
          Util.showErrorMessage(context, authResponse.message);
        }
      });
    } else {
      setState(() => _autoValidate = AutovalidateMode.onUserInteraction);
    }
  }
}
