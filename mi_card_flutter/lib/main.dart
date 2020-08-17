import 'package:flutter/material.dart';

void main() {
  runApp(
    Chapter6Challenge(),
  );
}

//we will now use a STATELESS flutter widget so we can use hot reload
// first type the shortcut "stless"

class MyApp extends StatelessWidget {
  //stateless widget code
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.teal,
        body: SafeArea(
          //safe Area widget prevents child widget to be on non-visible parts of the devise
          child: Column(
            //same applies to Rows
            crossAxisAlignment: CrossAxisAlignment
                .stretch, //axis alignment for the children, the widest child prevails
            //use .stretch to stretch all the children widgets

            // mainAxisAlignment: MainAxisAlignment.spaceBetween , //by default are all at the start of the axis
            // verticalDirection: VerticalDirection.down, //alters the order of the children
            // mainAxisSize:MainAxisSize.min , //by default column takes all available vertical space
            children: <Widget>[
              Container(
                //widget used to hold on to other elements and (limited to 1 widget control their size and properties
                height: 100.0,
                width: 100.0,
//            margin: EdgeInsets.only(left:30.0), //EdgeInsets sets the margin
                // of the container
                //.all() sets the padding for all 4 sides
                //.symmetric() sets the padding for up and down and sides
                //.fromLRTB() allows to set padding for each side individually
                //.only() allows to set sides for only some sides
                color: Colors.white,
                child: Text("Container 1"),
//            padding: EdgeInsets.all(20.0) , //padding sets the margin for the child of the container
              ),
              SizedBox(
                height: 20.0,
              ), //to control the spacing between children
              Container(
                width: 100.0,
                height: 100.0,
                color: Colors.blue,
                child: Text("Container 2"),
              ),
              Container(
                width: 100.0,
                height: 100.0,
                color: Colors.red,
                child: Text("Container 3"),
              ),
              // Container(width: double.infinity, height: 10.0),
            ], //note that it is plural
          ),
        ),
      ),
    );
  }
}

//Code Challenge widget
class Chapter6Challenge extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.teal,
        body: SafeArea(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                color: Colors.red,
                width: 100.0,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    color: Colors.yellow,
                    width: 100.0,
                    height: 100.0,
                  ),
                  Container(
                    color: Colors.green,
                    width: 100.0,
                    height: 100.0,
                  ),
                ],
              ),
              Container(
                color: Colors.blue,
                width: 100.0,
              )
            ],
          ), //we will be doing a row of columns
        ),
      ),
    );
  }
}
