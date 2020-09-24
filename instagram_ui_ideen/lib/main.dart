import 'package:flutter/material.dart';
import 'package:instagram_ui_ideen/Screens/HomeScreen.dart';

//MAIN METHOD
void main() => runApp(Main());

class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //HIDE DEBUG FLAG
      theme: ThemeData.light(),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
