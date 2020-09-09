import 'package:flutter/material.dart';
//EXAMPLE OF CREATING A CUSTOM WIDGET, GIVE IT PARAMETERS.

class ReusableCard extends StatelessWidget {
  //stateless widgets are immutable

//we will create a constructor for further reusability

  final Color color; //in stateless widgets, always make the properties final

  //FINAL VS CONST
  // FINAL IS FOR VALUES EXTRACTED AFTER THE CODE IS RUN
  //CONST IS FOR VALUES EXTRACTED AT RUNTIME

  //TO MAKE A PROPERTY REQUIRED USE @required before the variable name
  ReusableCard(
      {@required this.color,
      this.cardChild,
      this.onTap}); //shorthand constructor

  //UP NEXT WE WILL MAKE OUR WIDGET MORE CUSTOMIZABLE BY ADDING THE CHILD PROPERTY

  final Widget cardChild;

  //FUNCTIONS AS ARGUMENTS/FIRST ORDER OBJECTS

  //Functions can be stored in variables with the following syntax
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: this
          .onTap, //do not make the call. adding parenthesis () indicates that you want to call the function
      child: Container(
        child: cardChild,
        margin: EdgeInsets.all(17.0),
        decoration: BoxDecoration(
          //modify how the box container looks
          color: color,
          borderRadius:
              BorderRadius.circular(10.0), //makes borders look circular
        ),
      ),
    );
  }
}
