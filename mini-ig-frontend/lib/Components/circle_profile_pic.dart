import 'package:flutter/material.dart';
import 'package:instagram_ui_ideen/Utilities/Constants.dart';
import 'post.dart';

class CircleProfilePic extends StatelessWidget {
  CircleProfilePic({@required this.imageUrl});

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(50),
      child: Image(
        image: NetworkImage(imageUrl),
        width: 40.0,
        height: 40.0,
        fit: BoxFit.cover,
      ),
    );
  }
}
