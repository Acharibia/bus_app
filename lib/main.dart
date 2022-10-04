
import 'package:bus_app/screens/home/home_screen.dart';
import 'package:bus_app/screens/home/home_screen.dart';
import 'package:bus_app/screens/nav/cbn.dart';
import 'package:bus_app/screens/welcome/status.dart';
import 'package:bus_app/screens/welcome/welcome.dart';
import 'package:bus_app/services/authentication_service.dart';
import 'package:bus_app/services/main_model.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:scoped_model/scoped_model.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  // AuthenticationService.initializeService();
    await Firebase.initializeApp();
  SystemChrome.setSystemUIOverlayStyle( const SystemUiOverlayStyle(
    statusBarIconBrightness: Brightness.dark,
    statusBarColor: Colors.transparent,
  ));
  runApp(  MyApp());
}
class MyApp extends StatelessWidget {
   MyApp({Key? key}) : super(key: key);
    final MainModel mainModel = MainModel();


  @override
  Widget build(BuildContext context) {
    
    return ScopedModel<MainModel>(
      model: mainModel,
      child : MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          "/" : (context) => Status(),
           "/bottom_nav" : (context) =>Bottom(),
        },
       ) // );
     );
  }
  }


