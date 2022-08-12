import 'package:bus_app/components/rounded_button.dart';
import 'package:bus_app/components/social_media_options.dart';
import 'package:bus_app/screens/signin/sign_screen.dart';
import 'package:bus_app/services/auth_response.dart';
import 'package:bus_app/services/authentication_service.dart';
import 'package:bus_app/utils/util.dart';
import 'package:flutter/material.dart';


class SignUpForm extends StatefulWidget {
  SignUpForm({Key? key}) : super(key: key);

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
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
    return Padding(
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
                    hintText: "Name",
                    prefixIcon: Icon(
                      Icons.person,
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
                      return "Please enter name";
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
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
                TextFormField(
                   focusNode: _confirmpasswordFocusNode,
                  autovalidateMode: _confirmpasswordFocusNode.hasFocus
                      ? AutovalidateMode.onUserInteraction
                      : AutovalidateMode.disabled,
                  controller: cfrnPwdEditingController,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: "Confirm Password",
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
                      return "Confirm Password is required";
                    } else if (value != pwdEditingController.text) {
                      return "Password & Confirm Password should match";
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                RoundedButton(
                    label: "Sign Up",
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        //once no error, we will create user in firebase & open home screen
                        //here, but we will shortly write code for that once all screens are built.
                        //now lets include signup form widget in sign up screen & test
                        AuthenticationService().signUpWithEmail(
                            name: nameEditingController.text,
                            email: emailEditingController.text,
                            password: pwdEditingController.text)
                            .then((authResponse) {
                              if(authResponse.authStatus == AuthStatus.success){
                                Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const SignInScreen(),
                                    ),
                                        (route) => false); //lets check
                              }else{
                                //in case error, we will show error message using snackbar.
                                Util.showErrorMessage(context, authResponse.message);
                              }
                        });


                      }
                      else {
      setState(() => _autoValidate = AutovalidateMode.onUserInteraction);
    }
                    }),
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
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Already have an account? "),
              InkWell(
                onTap: () {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SignInScreen(),
                      ),
                      (route) => false); //lets check
                },
                child: Text(
                  "Sign In",
                  style: TextStyle(color: Colors.blue),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
