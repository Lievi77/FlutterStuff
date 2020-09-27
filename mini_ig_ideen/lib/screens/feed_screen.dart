import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:mini_ig_ideen/utilities/constants.dart';

class FeedScreen extends StatefulWidget {
  @override
  _FeedScreenState createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  bool _isLoading = true;
  FirebaseFirestore _db = FirebaseFirestore.instance;

  List<DocumentSnapshot> posts = [];

  @override
  void initState() {
    super.initState();

    _fetchPosts();
    //we will fetch the data from the firebase storage
  }

  //METHOD TO FETCH THE POSTS
  _fetchPosts() async {
    try {
      setState(() {
        _isLoading = true;
      });

      QuerySnapshot snap =
          await _db.collection("posts").orderBy("date", descending: true).get();

      setState(() {
        posts = snap.docs;
        _isLoading = false;
      });
    } on Exception catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return Container(
        child: LinearProgressIndicator(),
      );
    } else {
      return RefreshIndicator(
        onRefresh: () {
          _fetchPosts();

          return null;
        },
        child: Container(
          child: ListView.builder(
            itemCount: posts.length,
            itemBuilder: (context, index) {
              return Container(
                decoration: kPostContainerDecoration,
                margin: EdgeInsets.symmetric(
                  horizontal: 5.0,
                  vertical: 5.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(posts[index].data()["name"]),

                    SizedBox(
                      height: 5.0,
                    ),

                    //We will use FadeIn Image to display a placeholder while loading

                    ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: FadeInImage(
                          placeholder: AssetImage("assets/placeholder.jpg"),
                          image: NetworkImage(posts[index].data()["photoUrl"])),
                    ),

                    SizedBox(
                      height: 5.0,
                    ),

                    RichText(
                      softWrap: true,
                      text: TextSpan(style: kTextSpanStyle, children: [
                        TextSpan(
                            text: posts[index].data()["name"],
                            style: kUserCaptionDisplayStyle),
                        TextSpan(
                          text: "   " + posts[index].data()["caption"],
                          style: kCaptionDisplayStyle,
                        ),
                      ]),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      );
    }
  }
}
