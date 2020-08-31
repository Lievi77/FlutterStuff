import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: Text('Dicee'),
          backgroundColor: Colors.red,
        ),
        body: DicePage(),
      ),
    ),
  );
}

//Example of a State Widget
// A state widget allows us to fetch new data from a source.

class DicePage extends StatefulWidget {
  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int leftDiceNumber = 1;
  int rightDiceNumber = 1;

  //declare functions inside the class header

  void updateDice() {
    setState(() {
      leftDiceNumber = Random().nextInt(6) + 1;
      rightDiceNumber = Random().nextInt(6) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: <Widget>[
          Expanded(
            //this class makes the child to fit the Row or Column

            //flex: 2, //scaling factor compared to other Expanded Widgets defined

            child: FlatButton(
              onPressed: () {
                //   print("left got pressed"); // sample method syntax
                //   setState(() {
                //triggers a rebuild
                //   leftDiceNumber = Random().nextInt(6) +
                //1; //.nextInt(num) is from 0 to num (exclusive)

                // rightDiceNumber = Random().nextInt(6) + 1;
                //});

                updateDice();
              }, //void function
              child: Image.asset(
                  "images/dice$leftDiceNumber.png"), //${var_name} to access the value of var_name
            ),
          ),
          Expanded(
            child: FlatButton(
              onPressed: () {
                //   print("right got pressed");
                updateDice();
              },
              child: Image.asset("images/dice$rightDiceNumber.png"),
            ), //shorter notation for image asset
          ),
        ],
      ),
    );
  }
}
