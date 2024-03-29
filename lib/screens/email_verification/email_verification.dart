// import 'package:define_app1/src/utils/app_colors.dart';
// import 'package:define_app1/auth.config.dart';
// import 'package:define_app1/src/StudentProfile/StudentMainScreen.dart';
// import 'package:define_app1/src/scoped-model/main_model.dart';
// import 'package:define_app1/src/widgets/SignUpFonts.dart';
// import 'package:define_app1/src/widgets/SignUpWidgets.dart';
// import 'package:define_app1/src/widgets/show_dialog.dart';
// import 'package:email_auth/email_auth.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:scoped_model/scoped_model.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class VerifyScreen extends StatefulWidget {
//   VerifyScreen({Key? key}) : super(key: key);

//   @override
//   State<VerifyScreen> createState() => _VerifyScreenState();
// }

// class _VerifyScreenState extends State<VerifyScreen> {
//   GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey();
//    GlobalKey<FormState> _formkey = GlobalKey();
//   AutovalidateMode _autoValidate = AutovalidateMode.disabled;
//   bool ButtonState = false;
//   TextEditingController _entercode = new TextEditingController();
//   TextEditingController otpcontroller = new TextEditingController();
//     SharedPreferences? preferences;
//   var userEmail = "";
//    FocusNode _enterCodeFocusNode = FocusNode();

//   EmailAuth emailAuth = new EmailAuth(sessionName: "Defyn");
//   FocusNode emailFocusNode = FocusNode();
//   late String email;

//   checkAuthentification() async {
//     FirebaseAuth.instance.authStateChanges().listen((user) {
//       if (user != null) {
//         setState(() {
//           email = user.email!;
//         });
//       }
//     });
//   }

// Future<String?> getPreference() async {
//     // _isloading = true;
//     // notifyListeners();
//     this.preferences = await SharedPreferences.getInstance();
//     userEmail = this.preferences!.getString("email")!;
//     print({"Printing email": userEmail});
//     // print({"Printing username": fullname});
//     return userEmail;
//   }
//   @override
//   void initState() {
//     super.initState();
//     // Initialize the package
//     emailAuth = new EmailAuth(
//       sessionName: "Defyn",
//     );

//     /// Configuring the remote server
//     emailAuth.config(remoteServerConfiguration);
//     //get users
//     // this.checkAuthentification();
//   }

//   Widget _buildEnterCodeTextField() {
//     return TextFormField(
//        focusNode: _enterCodeFocusNode,
//       autovalidateMode: _enterCodeFocusNode.hasFocus
//           ? AutovalidateMode.onUserInteraction
//           : AutovalidateMode.disabled,
//       onSaved: (value) {
//         _entercode.text = value!.trim();
//       },
//       validator: (String? code) {
//         late String errorMessage;
//         String pattern =
//             r"^[1-9]+[0-9]*$";
            
//         RegExp regex = RegExp(pattern);

//         if (code!.isEmpty) {
//           errorMessage = "code is required";
//           return errorMessage;
//         }
//         if (!regex.hasMatch(code)) {
//           errorMessage = "Enter a valid otp code";
//           return errorMessage;
//         }
//          if (code.length != 6) {
//           errorMessage = "Code must 6 numbers";
//           return errorMessage;
//         }

//         return null;
//       },
//       controller: _entercode,
//         keyboardType: TextInputType.number,
//       decoration: InputDecoration(
//         border: InputBorder.none,
//         hintText: 'Enter code',
//         hintStyle: TextStyle(
//           fontFamily: 'GothamRounded',
//           fontSize: 15.sp,
//           color: cDarkGray,
//         ),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     final double shortestSide = MediaQuery.of(context).size.shortestSide;
//     final bool useLayout = shortestSide > 600.0;

//     return Scaffold(
//       key: _scaffoldkey,
//       resizeToAvoidBottomInset: false,
//       backgroundColor: cDarkBlue,
//       body: SafeArea(
//         child: Center(
//           child: Form(
            
//             onChanged: (){
//               setState(() {
//                 ButtonState = _formkey.currentState!.validate();
//               });
//             },
//             key: _formkey,
//             child: Column(
//               children: [
//                 Expanded(
//                   child: Container(
//                     child: SvgPicture.asset(
//                       'assets/images/svgWhiteLogo.svg',
//                       height: 30.h,
//                     ),
//                   ),
//                 ),
//                 Expanded(
//                   flex: 6,
//                   child: SignUpBackground(
//                     color: cWhite,
//                     child: Center(
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Container(
//                             child: tutor(
//                               'Verify Your Email',
//                               Color(0xFF192841),
//                             ),
//                           ),
//                           SizedBox(
//                             height: useLayout ? 55.h : 35.h,
//                           ),
//                           Text(
//                             "Please enter the 6 digit code sent to your email",
//                             style: TextStyle(
//                                 color: cDarkBlue, fontWeight: FontWeight.bold),
//                           ),
//                           SizedBox(
//                             height: 25.h,
//                           ),
//                           TextFieldContainer(
//                             child: Container(child: _buildEnterCodeTextField()),
//                           ),
//                           SizedBox(
//                             height: 25.h,
//                           ),
//                           TextButton(
//                             onPressed: () {

//                             },
//                             child: signIn(
//                               'Resend code',
//                               cDarkBlue,
//                             ),
//                           ),
//                           SizedBox(
//                             height: 25.h,
//                           ),
//                           _buildConfirmButton(),
//                           SizedBox(
//                             height: 30.h,
//                           ),
//                           SizedBox(
//                             height: 35.h,
//                           ),
//                           TextButton(
//                             onPressed: () {
//                               Navigator.pushNamed(context, "/StudentSignIn");
//                             },
//                             child: signIn(
//                               'Sign In',
//                               cDarkBlue,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildConfirmButton() {
//     return ScopedModelDescendant<MainModel>(
//         builder: (BuildContext ctx, Widget? child, MainModel model) {
//       return SignUpButton(
//         signUpState: ButtonState,
//           text: signUp(
//             'Confirm',
//             cWhite,
//           ),
//           press: () {
            
//             // verify();
       
//             onSubmit(model.ValidateEmail);
//             if(model.isLoading){
//               showLoadingIndicator(context, "Verifying email");
//             }
//           });
//     });
//   }

// //   void verify() {
// //     var result = emailAuth.validateOtp(
// //         recipientMail: email.trim(), userOtp: otpcontroller.text);
// //     if (!result) {
// //       _scaffoldkey.currentState!.showSnackBar(SnackBar(
// //         duration: Duration(seconds: 4),
// //         backgroundColor: Colors.red,
// //         content: Text("Email has been verified"),
// //       ));

// //        Navigator.pushAndRemoveUntil(
// //           context,
// //           MaterialPageRoute(builder: (context) => StudentMainScreen()),
// //           (route) => false);
// //     } else {
// //       _scaffoldkey.currentState!.showSnackBar(SnackBar(
// //         duration: Duration(seconds: 4),
// //         backgroundColor: Colors.red,
// //         content: Text("Wrong OTP"),
// //       ));
// //     }
// //   }
// // }

//   void onSubmit(Function ValidateEmail ) {
//       if (_formkey.currentState!.validate()){
//         _formkey.currentState!.save();
//    var result = ValidateEmail(userEmail.trim(), otpcontroller.text.trim());
//     if (result != null) {
//       _scaffoldkey.currentState!.showSnackBar(SnackBar(
//         duration: Duration(seconds: 4),
//         backgroundColor: Colors.red,
//         content: Text("Email has been verified"),
//       ));
//       Navigator.of(context).pop();
//        Navigator.pushAndRemoveUntil(
//           context,
//          MaterialPageRoute(builder: (context) => StudentMainScreen()),
//         (route) => false);
//     }  else {
//         _scaffoldkey.currentState!.showSnackBar(SnackBar(
//           duration: Duration(seconds: 4),
//           backgroundColor: Colors.red,
//           content: Text("Wrong OTP"),
//         ));
//       }
        
//       } else {
//       setState(() => _autoValidate = AutovalidateMode.onUserInteraction);
//     }
    
  
//   }
// }
