import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mini_ig_ideen/screens/splash_screen.dart';
import 'package:mini_ig_ideen/utilities/constants.dart';

void main() async {
  //new firebase versions require to initialize firebase beforehand
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(Main());
}

class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),

      //use font in theme data
      //instead of poppins i used Grandstander
      theme: ThemeData(
          fontFamily: "Grandstander", primaryColor: kPrimaryScreenColor),
    );
  }
}
