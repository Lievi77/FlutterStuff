import 'package:flutter/material.dart';
import 'package:instagram_ui_ideen/Utilities/Constants.dart'; //Style Constants and other utilities
import 'package:flutter_icons/flutter_icons.dart'; //For top bar icon
import 'package:instagram_ui_ideen/Components/icon_button.dart';
import 'package:instagram_ui_ideen/Utilities/Story.dart';
import 'package:instagram_ui_ideen/Components//scrollable_circular_image_bar.dart';
import 'package:instagram_ui_ideen/Components/post.dart';
import 'package:instagram_ui_ideen/Components/circle_profile_pic.dart';

class HomeScreen extends StatelessWidget {
  //string to hold the url of several ig story pictures
  //urls link directly to images on the web
  final List<Story> _stories = [
    //Example of a Set Class in Dart
    //sets are like maps BUT every object can appear ONLY once

    //EXAMPLE:{ URL, URL  }

    Story(
        'https://images.pexels.com/photos/1108099/pexels-photo-1108099.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
        "Doggo"),
    Story(
        'https://images.pexels.com/photos/1458916/pexels-photo-1458916.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
        "Pupper"),
    Story(
        'https://images.pexels.com/photos/1805164/pexels-photo-1805164.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
        "Papriko"),
    Story(
        'https://images.pexels.com/photos/248307/pexels-photo-248307.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
        "Toledo"),
    Story(
        'https://images.pexels.com/photos/1851164/pexels-photo-1851164.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
        "Pascual"),
    Story(
        'https://images.pexels.com/photos/257519/pexels-photo-257519.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
        "Kipe"),
  ];

  final List<Post> posts = [
    //post requires strings on all instances

    Post(
        userImage:
            'https://images.pexels.com/photos/452557/pexels-photo-452557.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
        username: "Keka",
        postImage:
            'https://images.pexels.com/photos/1831236/pexels-photo-1831236.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
        caption: "Here in the beach"),

    Post(
        userImage:
            'https://images.pexels.com/photos/1680172/pexels-photo-1680172.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
        username: "Perth",
        postImage:
            'https://images.pexels.com/photos/577585/pexels-photo-577585.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
        caption: "Hello World"),
    Post(
        userImage:
            'https://images.pexels.com/photos/156934/pexels-photo-156934.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
        username: "Le Chat Blanc",
        postImage:
            'https://images.pexels.com/photos/1314550/pexels-photo-1314550.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
        caption: "#selfie"),
    Post(
        userImage:
            'https://images.pexels.com/photos/2701783/pexels-photo-2701783.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
        username: "Okuyasu",
        postImage:
            'https://images.pexels.com/photos/1765631/pexels-photo-1765631.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
        caption: "Wash your hands"),
    Post(
        userImage:
            'https://images.pexels.com/photos/5082976/pexels-photo-5082976.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
        username: "Anasui",
        postImage:
            'https://images.pexels.com/photos/1860618/pexels-photo-1860618.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
        caption: "Dolphin"),
  ];

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

              //.builder only calls the build method for visible content only
              //lazy display, saves resources
              //THIS CONTAINER IS FOR THE STORIES BAR
              Container(
                //Defining the background
                //use the mediaquery class to get information about the ui containing your app
                width: MediaQuery.of(context).size.width,
                height: kStoriesContainerHeight,
                margin: EdgeInsets.symmetric(vertical: 10.0),
                child: ScrollableCircularImageBar(contents: _stories),
              ),

              Container(
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: posts.length,
                  itemBuilder: (context, i) {
                    return Container(
                      child: Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              CircleProfilePic(
                                imageUrl: posts[i].userImage,
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              Text(posts[i].username),
                            ],
                          ),
                          Image(
                            image: NetworkImage(posts[i].postImage),
                            width: MediaQuery.of(context).size.width,
                          ),
                          Text(
                            //TIME STAMP:31:50
                            posts[i].caption,
                            style: kCaptionStyle,
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
