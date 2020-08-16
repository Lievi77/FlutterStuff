//My first app using flutter

//@author: Lev Cesar Guzman Aparicio
//@email: lguzm038@uottawa.ca

import 'package:flutter/material.dart';

//to make use of the dart formatter, insert a comma after a closing bracket "),"

//////////////////////////////////////////////////////
///////////////// SCAFFOLD WIDGET APP/////////////////
//////////////////////////////////////////////////////

//we will be using the alternate shorthand syntax
//it doesnt matter what method syntax you use,
//however I personally find the bracket syntax more clear to understand

//draw.io to illustrate the tree structure of the app
void main() => runApp(
      MaterialApp(
        home: Scaffold(

          backgroundColor: Colors.blue[200], //background color of home

          appBar: AppBar(
            title:  Text("El Mas Guapo de Laurier") ,
            backgroundColor:
                Colors.lightBlue[900], // where 900 is the tone we want
          ), //appBar: (lower case) means that we are selecting the property or space where the appbar should be

          body: Center(
            child: Image(
              //we can alternatively use NetWorkImage("url")
              image: AssetImage("images/ehecatl.jpg"),
            ),
          ), //AssetImage pulls an image from our resources
        ),
      ),
    );

//////////////////////////////////////////////////////
///////////////// MATERIAL APP ///////////////////////
//////////////////////////////////////////////////////

/*
void main() {
  //you can also use the javascript syntax: void method() =>
  //we will use the material design design pattern
  runApp(
    MaterialApp(
      //we will always start an app with a {home:} widget (double check this)
      home: Center(
        //use {child:} widget in order to build bottom down in the structure tree
        child: Text("Hola Mundo"),
      ),
    ),
  );
}
*/
