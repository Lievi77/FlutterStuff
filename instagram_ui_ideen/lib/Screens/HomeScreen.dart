import 'package:flutter/material.dart';
import 'package:instagram_ui_ideen/Utilities/Constants.dart'; //Style Constants and other utilities
import 'package:flutter_icons/flutter_icons.dart'; //For top bar icon
import 'package:instagram_ui_ideen/Components/icon_button.dart';

class HomeScreen extends StatelessWidget {
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
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              //Divides the screen. Creates a bar that makes division of screen visible
              Divider(
                color: Colors.black,
              ),

              Container(
                margin: EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "Stories",
                      style: kStoriesTitleStyle,
                    ),
                    Text(
                      "View All",
                      style: kStoriesTitleStyle,
                    )
                  ],
                ),
              ),

              //TIME STAMP:7:29
            ],
          ),
        ),
      ),
    );
  }
}
