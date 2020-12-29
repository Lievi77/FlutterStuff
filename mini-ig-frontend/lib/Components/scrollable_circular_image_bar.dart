import 'package:flutter/material.dart';
import 'package:instagram_ui_ideen/Utilities/Story.dart';
import 'package:instagram_ui_ideen/Utilities/Constants.dart';

class ScrollableCircularImageBar extends StatelessWidget {
  ScrollableCircularImageBar({@required this.contents});

  final List<Story> contents;

  @override
  Widget build(BuildContext context) {
    return ListView(
      //itemCount: _stories.length,
      //specify direction
      scrollDirection: Axis.horizontal,

      //Enables the extent of the scroll view in function of the content being displayed
      shrinkWrap: true,

      //method used to contruct the visible widgets, works only for ListView.builder
//                  itemBuilder: (context, index) {
//                    //returns the widget to be constructed
//
//                    return Image(
//                      image: NetworkImage(_stories[index]),
//                      width: 200.0,
//                      height: 200.0,
//                    );
//                  },

      children: contents.map((story) {
        ///
        return Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10.0),
              decoration: kImagesContainerDecoration,
              child: Container(
                padding: EdgeInsets.all(2.0),
                child: ClipRRect(
                  //clips the child to a rectangle by default but can be customized
                  borderRadius: BorderRadius.circular(40.0),
                  child: Image(
                    //following OOP implementation
                    image: NetworkImage(story.getImageUrl()),
                    width: kStoryImageWidth,
                    height: kStoryImageHeight,
                    //BoxFit tells how the image should cover the container
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            //Box to give some space between image and name
            SizedBox(
              height: 2.0,
            ),
            Text(
              story.getImageName(),
              style: kStoriesTitleStyle,
            ),
          ],
        );
        ////
      }).toList(),
    );
  }
}
