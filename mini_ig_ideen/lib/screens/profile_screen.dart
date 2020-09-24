import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mini_ig_ideen/utilities/constants.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String _name;

  String _photoUrl;

  @override
  void initState() {
    super.initState();
    getProfileData();
  }

  dynamic getProfileData() async {}

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        //timestamp: 40:10
        children: <Widget>[
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
  }
}
