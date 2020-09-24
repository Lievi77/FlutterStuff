import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mini_ig_ideen/screens/feed_screen.dart';
import 'package:mini_ig_ideen/screens/profile_screen.dart';
import 'package:mini_ig_ideen/utilities/constants.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //index to keep track of where we are
  int currentPageIndex = 0;

  var pages = [FeedScreen(), ProfileScreen()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mini IG"),
        centerTitle: false,

        //action widgets to be displayed on the bar
        actions: <Widget>[
          IconButton(
            //tooltip enables the widget to display a text message when pressed and held
            tooltip: "Take a picture",
            icon: Icon(Icons.camera),
            onPressed: () {},
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.image),
            title: Text("Feed"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            title: Text("Profile"),
          )
        ],
        onTap: (i) {
          setState(() {
            currentPageIndex = i;
          });
        },
      ),
      body: pages[currentPageIndex],
    );
  }
}
