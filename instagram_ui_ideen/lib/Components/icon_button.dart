import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class AppBarIcon extends StatelessWidget {
  AppBarIcon({@required this.icon, @required this.onPressed});

  final Icon icon;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: icon,
      color: Colors.black,
    );
  }
}
