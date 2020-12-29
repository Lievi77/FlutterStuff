import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mini_ig_ideen/utilities/constants.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  //Name and Photo urls storage
  String name;

  String photoUrl;

  //firebase firestore database instance
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  //firebase firebaseauth instance
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //LOADING DISPLAY
  bool isLoaded = false;

  @override
  void initState() {
    super.initState();
    getProfileData();
  }

  dynamic getProfileData() async {
    try {
      //retrieve the user
      User user = await _auth.currentUser;

      //path goes to the Firestore tab in the Firebase console

      DocumentSnapshot doc = await _db.collection("users").doc(user.uid).get();



      setState(() {
        // the keywords in the [] brackets are determined by how the data is stored in Firebase
        name = doc.data()['displayName'];


        photoUrl = doc.data()['photoURL'];

        isLoaded = true;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isLoaded) {
      return Container(
        child: Column(
          //timestamp: 40:10
          children: <Widget>[
            Center(
              child: Container(
                margin: EdgeInsets.only(top: 50.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(kProfilePicRadius),
                  child: Image(
                    image: NetworkImage(photoUrl),
                    width: kProfilePicWidth,
                    height: kProfilePicHeight,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),

            SizedBox(height: 20.0,),


            Text(
              name
              ,style: kProfileNameDisplayStyle,
            ),

            RaisedButton(
              onPressed: () {
                //signout, easy!
                FirebaseAuth.instance.signOut();
              },
              child: Text("Logout"),
            ),
          ],
        ),
      );
    } else {
      return Container(
        child: Center(
          child: Text("Loading"),
        ),
      );
    }
  }
}
