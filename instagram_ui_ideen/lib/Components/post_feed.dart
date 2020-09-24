import 'package:flutter/material.dart';
import 'package:instagram_ui_ideen/Utilities/Constants.dart';
import 'post.dart';
import 'package:flutter_icons/flutter_icons.dart'; //For top bar icon
import 'circle_profile_pic.dart';

class PostFeed extends StatelessWidget {
  PostFeed({@required this.posts});
  final List<Post> posts;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: posts.length,
      itemBuilder: (context, i) {
        return Container(
          color: Colors.white,
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 10.0,
                  vertical: 5.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: <Widget>[
                        CircleProfilePic(
                          imageUrl: posts[i].userImage,
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        Text(
                          posts[i].username,
                          style: kUsernameStyle,
                        ),
                      ],
                    ),
                    IconButton(
                      icon: Icon(SimpleLineIcons.options),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
              FadeInImage(
                placeholder: NetworkImage(
                    "https://images.pexels.com/photos/2253275/pexels-photo-2253275.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"),
                image: NetworkImage(posts[i].postImage),
                width: MediaQuery.of(context).size.width,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: <Widget>[
                      IconButton(
                        icon: Icon(FontAwesome.heart_o),
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: Icon(FontAwesome.comment_o),
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: Icon(FontAwesome.send_o),
                        onPressed: () {},
                      ),
                    ],
                  ),
                  IconButton(
                    icon: Icon(FontAwesome.bookmark_o),
                    onPressed: () {},
                  ),
                ],
              ),

              //uses InLineSpan()
              Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.symmetric(
                  horizontal: 10.0,
                ),
                child: RichText(
                  softWrap: true,
                  overflow: TextOverflow.visible,
                  text: TextSpan(children: [
                    TextSpan(
                      text: "Liked by ",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    TextSpan(
                      text: "Ehecatl",
                      style: kLikedDisplayStyle,
                    ),
                    TextSpan(
                      text: ", Okuyasu",
                      style: kLikedDisplayStyle,
                    ),
                    TextSpan(
                      text: " and",
                      style: kLikedDisplayStyle,
                    ),
                    TextSpan(
                      text: " 12933 others",
                      style: kLikedDisplayStyle,
                    ),
                  ]),
                ),
              ),

              //CAPTIONS
              Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.symmetric(
                  horizontal: 10.0,
                  vertical: 5.0,
                ),
                child: RichText(
                  softWrap: true,
                  overflow: TextOverflow.visible,
                  text: TextSpan(children: [
                    TextSpan(
                      text: posts[i].username,
                      style: kLikedDisplayStyle,
                    ),
                    TextSpan(
                      text: " ${posts[i].caption}",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ]),
                ),
              ),

              Container(
                child: Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: 10.0,
                  ),
                  alignment: Alignment.topLeft,
                  child: Text(
                    "February 20, 2020",
                    textAlign: TextAlign.start,
                    style: kDateCaptionStyle,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
