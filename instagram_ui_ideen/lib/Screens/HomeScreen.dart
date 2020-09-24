import 'package:flutter/material.dart';
import 'package:instagram_ui_ideen/Components/feed.dart';
import 'package:instagram_ui_ideen/Utilities/Constants.dart'; //Style Constants and other utilities
import 'package:flutter_icons/flutter_icons.dart'; //For top bar icon
import 'package:instagram_ui_ideen/Components/icon_button.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _pages = [
    Feed(),
    Feed(),
    Feed(),
    Feed(),
    Feed(),
  ];

  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Scaffold uses the same background color as the AppBar
      backgroundColor: kAppBarBackgroundColor,

      appBar: AppBar(
        elevation: 0,
        backgroundColor: kAppBarBackgroundColor,
        centerTitle: true,
        title: Text(
          "Instagram",
          style: kAppBarTitleStyle,
        ),
        brightness: Brightness.light,
        leading: AppBarIcon(
          icon: Icon(Feather.camera),
          onPressed: () {},
        ),

        //actions is a set of widgets to be displayed after the title
        actions: <Widget>[
          //IGTV ICON CLONE
          AppBarIcon(
            icon: Icon(Feather.tv),
            onPressed: () {},
          ),
          //SEND ICON
          AppBarIcon(
            icon: Icon(Feather.send),
            onPressed: () {},
          ),
        ],
      ),

      //Scroll down functionality
      body: _pages[currentPage],
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: Colors.black,
        currentIndex: currentPage,
        onTap: (i) {
          setState(() {
            currentPage = i;
          });
        },
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Foundation.home),
            title: Text("Feed"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Feather.search),
            title: Text("Search"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Feather.plus_square),
            title: Text("Upload"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Feather.heart),
            title: Text("Likes"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Feather.user),
            title: Text("Account"),
          ),
        ],
      ),
    );
  }
}
