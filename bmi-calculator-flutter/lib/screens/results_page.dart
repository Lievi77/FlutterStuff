import 'package:bmi_calculator/components/Reusable_Card.dart';
import 'package:bmi_calculator/components/bottom_button.dart';
import 'package:flutter/material.dart';
import '../Constants.dart';

class ResultsPage extends StatelessWidget {
  final String BMI;
  final String result;
  final String interpretation;

  ResultsPage({this.BMI, this.result, this.interpretation});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI CALCULATOR"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15.0),
              alignment: Alignment.bottomLeft,
              child: Text(
                "Your Result",
                style: kResultTitleStyle,
              ),
            ),
          ),
          Expanded(
            flex:
                5, //FLEX PROPERTY ALLOWS THE EXPANDED WIDGET TO TAKE MORE SPACE

            child: ReusableCard(
              color: kActiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    result.toUpperCase(),
                    style: kResultTextStyle,
                  ),
                  Text(
                    BMI,
                    style: kBMIStyle,
                  ),
                  Text(
                    interpretation,
                    textAlign: TextAlign.center,
                    style: kBodyTextStyle,
                  ),
                ],
              ),
            ),
          ),
          BottomButton(
            text: "RE-CALCULATE",
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
