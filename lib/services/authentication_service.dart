import 'package:bus_app/services/main_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:bus_app/services/auth_response.dart';
import 'package:flutter/foundation.dart';
import 'package:scoped_model/scoped_model.dart';

class AuthenticationService  extends Model{
  static const String emptyMsg = "";
  final FirebaseAuth _auth = FirebaseAuth.instance;
  bool _isloading = false;

    bool get isLoading {
    return _isloading;
  }


  static Future initializeService() async {
    //lets call this init method from main runApp function call
    //for web app we need to initialize it differently
    if (kIsWeb) {
      await Firebase.initializeApp(
          options: const FirebaseOptions(
              apiKey: "AIzaSyAIDMO2dhB1eUve3dW4i7-lK9AODUiA_w4",
              authDomain: "bus-app-a3fe3.firebaseapp.com",
              projectId: "bus-app-a3fe3",
              storageBucket: "bus-app-a3fe3.appspot.com",
              messagingSenderId: "834710142190",
              appId: "1:834710142190:web:202f8738f45e7290e847ff",
              measurementId: "G-W087F5T7S0"));
    }else {
      await Firebase.initializeApp();
    }
  }

  Future<AuthResponse> signUpWithEmail(
      {required String name,
      required String email,
      required String password}) async {
    //lets call this method from signup screen
     _isloading = true;
    notifyListeners();
    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);
      await userCredential.user!.updateDisplayName(name);
      return AuthResponse(AuthStatus.success, emptyMsg);
    } on FirebaseAuthException catch (e) {
       _isloading = false;
    notifyListeners();
      return AuthResponse(AuthStatus.error, generateErrorMessage(e.code));
    }
  }

  Future<AuthResponse> signInWithEmail(
      {required String email, required String password}) async {
         _isloading = true;
    notifyListeners();
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      return AuthResponse(AuthStatus.success, emptyMsg);
    } on FirebaseAuthException catch (e) {
       _isloading = false;
    notifyListeners();
      return AuthResponse(AuthStatus.error, generateErrorMessage(e.code));
    }
  }

  Future<AuthResponse> resetPassword({
    //lets call this function from forgot password screen
    required String email,
  }) async {
    try {
      await _auth.sendPasswordResetEmail(
        email: email,
      );
      return AuthResponse(AuthStatus.success, emptyMsg);
    } on FirebaseAuthException catch (e) {
      return AuthResponse(AuthStatus.error, generateErrorMessage(e.code));
    }
  }

  Future signOut() async {
    //lets call this function to signout user from firebase
    await _auth.signOut();
  }

  String? getUserName() {
    return _auth.currentUser!.displayName;
  }

  String generateErrorMessage(errorCode) {
    String errorMessage;
    switch (errorCode) {
      case "invalid-email":
        errorMessage = "Your email address appears to be malformed";
        break;
      case "weak password":
        errorMessage = "your password should be at least 6 characters";
        break;
      case "email-already-in-use":
        errorMessage = "The email address is already in use by another account";
        break;
      case "user-not-found":
        errorMessage = "User with this credentials does not exits";
        break;
      default:
        errorMessage = "Unexpected error occurred, please try later";
    }
    return errorMessage;
  }
}
