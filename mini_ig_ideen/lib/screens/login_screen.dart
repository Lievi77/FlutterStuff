import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mini_ig_ideen/utilities/constants.dart';
import 'package:flutter_auth_buttons/flutter_auth_buttons.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginScreen extends StatelessWidget {
  void doGoogleSignIn() async {
    try {
      final GoogleSignIn googleSignIn = GoogleSignIn();
      final FirebaseAuth auth = FirebaseAuth.instance;

      final GoogleSignInAccount googleUser = await googleSignIn.signIn();
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      final User user = (await auth.signInWithCredential(credential)).user;
      print('signed in' + user.displayName);

      //now that we have the credentials, we must store them

      //collection is like a folder
      //create a folder for the user or a record per say
      FirebaseFirestore.instance.collection("users").doc(user.uid).set({
        "email": user.email,
        "displayName": user.displayName,
        "photoURL": user.photoURL,
        "lastLogin": DateTime.now(),
      });
    } on Exception catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          children: <Widget>[
            Center(
              child: Text(
                "Mini IG",
                style: kLoginScreenTitleStyle,
              ),
            ),
            Container(
              alignment: Alignment.bottomCenter,
              margin: EdgeInsets.only(bottom: 300.0),
              child: GoogleSignInButton(
                onPressed: () {
                  doGoogleSignIn();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
