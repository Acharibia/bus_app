
import 'package:bus_app/screens/home/home_screen.dart';
import 'package:bus_app/screens/welcome/welcome.dart';
import 'package:bus_app/services/authentication_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  AuthenticationService.initializeService();
  SystemChrome.setSystemUIOverlayStyle( const SystemUiOverlayStyle(
    statusBarIconBrightness: Brightness.dark,
    statusBarColor: Colors.transparent,
  ));
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          "/" : (context) => WelcomeScreen(),
          "/home" : (context) =>HomeScreen(),
        },
    );

  }
}


