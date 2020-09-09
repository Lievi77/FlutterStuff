import 'package:flutter/material.dart';
import 'input_page.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        //ALTERNATIVELY, INSTANTIATE A NEW THEMEDATA OBJ.

        primaryColor: Color(0xFF0A0E21), //DELETE HASHTAG FROM HEX, ADD 0xFF
        //accentColor: Colors.purple,
        scaffoldBackgroundColor: Color(0xFF0A0E21),
//        textTheme: TextTheme(
//          bodyText2: TextStyle(
//            //modify bodyText2 for main text
//            color: Color(0xFFFFFFFF),
//          ),
//        ),
      ),
      home: InputPage(),
    );
  }
}

////////////// IT IS GOOD PRACTICE TO SEPARATE PAGES/COMPONENTS ONTO DIFF .DART FILES////////////////////

//class InputPage extends StatefulWidget {
//  @override
//  _InputPageState createState() => _InputPageState();
//}
//
//class _InputPageState extends State<InputPage> {
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(
//        title: Text('BMI CALCULATOR'),
//      ),
//      body: Center(
//        child: Text('Body Text'),
//      ),
////      floatingActionButton: Theme(
////        data: ThemeData
////            .light(), //we can also assign a theme to a particular widget
////        child: FloatingActionButton(
////          child: Icon(Icons.add),
////        ),
////      ),
//    );
//  }
//}
