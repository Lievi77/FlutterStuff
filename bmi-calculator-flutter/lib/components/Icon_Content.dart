import 'package:flutter/material.dart';

class CardStyle extends StatelessWidget {
  CardStyle({this.displayIcon, this.displayText, this.displayTextStyle});

  final Icon displayIcon;
  final String displayText;
  final TextStyle displayTextStyle;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        displayIcon,
        SizedBox(
          height: 15.0,
        ),
        Text(
          displayText,
          style: displayTextStyle,
        )
      ],
    );
  }
}
