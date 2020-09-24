import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mini_ig_ideen/screens/home_screen.dart';
import 'package:mini_ig_ideen/screens/login_screen.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //streamBuilder listens to a particular stream of data
    return StreamBuilder(
      //stream that listens to a particular steam of data provided by FirebaseAuth
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, AsyncSnapshot<User> snapshot) {
        if (snapshot.hasData) {
          //avoid shell data (empty objects)
          if (snapshot.data != null) {
            //user is signed in and is not a shell (empty) user
            return HomeScreen();
          } else {
            //if we have a shell (empty) user
            return LoginScreen();
          }
        }

        //if user is not signed in
        return LoginScreen();
      },
    );
  }
}
