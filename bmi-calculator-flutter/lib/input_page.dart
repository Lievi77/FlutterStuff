//file to harbor the input screen

import 'package:bmi_calculator/results_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'Reusable_Card.dart';
import 'Icon_Content.dart';
import 'Constants.dart';

//GOOD PRACTICE TO SET CONSTANTS AT THE BEGINNING OR IN A SEPERATE FILE
//const bottomContainerHeight = 80.0;
//const reusableCardsColor = 0xFF1D1E33;
//const bottomContainerColor = 0xFFEB1555;
//const fontColorBoxes = 0xFF8D8E98;
//const activeCardColor = Color(0xFF1D1E33);
//const inactiveCardColor = Color(0xFF111328);

//ENUM DECLARATION EXAMPLE
enum Genders { Male, Female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
//  Color maleCardColor = inactiveCardColor;
//  Color femaleCardColor = inactiveCardColor;

  Genders selectedGender;

  int height = 180;

  int weight = 60;

  int age = 30;

//  void updateCardColor(Genders gender) {
//    //if 1 = male,2 = female
//
//    //We can use the enum as a Data Type
//    //access elements via dot operator
//
//    //TERTIARY OPERATOR ()?:
//
//
//
//    if (gender == Genders.Male) {
//
//      maleCardColor == inactiveCardColor ? maleCardColor = activeCardColor  :  ?
//
//      if (maleCardColor == inactiveCardColor) {
//        maleCardColor = activeCardColor;
//        femaleCardColor = inactiveCardColor;
//      } else {
//        maleCardColor = inactiveCardColor;
//      }
//    } else {
//      if (femaleCardColor == inactiveCardColor) {
//        femaleCardColor = activeCardColor;
//        maleCardColor = inactiveCardColor;
//      } else {
//        femaleCardColor = inactiveCardColor;
//      }
//    }
//  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    onTap: () {
                      setState(() {
                        //MALE GOT CLICKED
                        selectedGender = Genders.Male;
                      });
                    },
                    cardChild: CardStyle(
                      displayIcon: Icon(
                        FontAwesomeIcons.mars,
                        size: 80.0,
                      ),
                      displayText: "MALE",
                      displayTextStyle: TextStyle(
                        fontSize: 18.0,
                        color: Color(kFontColorBoxes),
                      ),
                    ),
                    color: selectedGender ==
                            Genders
                                .Male //CAN USE TERTIARY OPERATOR TO ASSIGN VALUES TO A PROPERTY
                        ? kActiveCardColor
                        : kInactiveCardColor,
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onTap: () {
                      setState(() {
                        selectedGender = Genders.Female;
                      });
                    },
                    cardChild: CardStyle(
                      displayIcon: Icon(
                        FontAwesomeIcons.venus,
                        size: 80.0,
                      ),
                      displayText: "FEMALE",
                      displayTextStyle: TextStyle(
                        fontSize: 15.0,
                        color: Color(kFontColorBoxes),
                      ),
                    ),
                    color: selectedGender == Genders.Female
                        ? kActiveCardColor
                        : kInactiveCardColor,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              color: Color(kReusableCardsColor),
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "HEIGHT",
                    style: kLabelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(
                        height.toString(),
                        style: kHeavyLabelTextStyle,
                      ),
                      Text(
                        "cm",
                        style: kLabelTextStyle,
                      )
                    ],
                  ),
                  SliderTheme(
                    //.of returns a copy
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: Colors.white,
                      inactiveTrackColor:
                          Color(0xFF8D8E98), //usually stored in constant file
                      overlayColor: Color(0x29EB1555),
                      thumbColor: Color(0xFFEB1555),
                      thumbShape: RoundSliderThumbShape(
                        enabledThumbRadius: 15.0,
                      ),
                      overlayShape: RoundSliderOverlayShape(
                        overlayRadius: 30.0,
                      ),
                    ),
                    child: Slider(
                      onChanged: (double newValue) {
                        print(newValue);

                        setState(() {
                          height = newValue.round();
                        });
                      },
                      value: height.toDouble(),
                      min: 120,
                      max: 220,
                      // activeColor: Color(0xFFEB1555), //SELECTED PART OF THE BAR
                      // inactiveColor:
                      //     Color(0xFF8D8E98), //UNSELECTED PART OF THE BAR
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    color: Color(kReusableCardsColor),
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "WEIGHT",
                          style: kLabelTextStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: kHeavyLabelTextStyle,
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                                onPressed: () {
                                  setState(() {
                                    weight--;
                                  });
                                },
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              RoundIconButton(
                                icon: FontAwesomeIcons.plus,
                                onPressed: () {
                                  setState(() {
                                    weight++;
                                  });
                                },
                              ),
                            ])
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    color: Color(kReusableCardsColor),
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "AGE",
                          style: kLabelTextStyle,
                        ),
                        Text(
                          age.toString(),
                          style: kHeavyLabelTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  age--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  age++;
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ResultsPage()),
              );
            },
            child: Container(
              child: Text(
                "CALCULATE",
                style: kHeavyLabelTextStyle,
              ),
              color: Color(kBottomContainerColor),
              margin: EdgeInsets.only(top: 10.0),
              width: double.infinity,
              height: kBottomContainerHeight,
            ),
          ),
        ],
      ),
    );
  }
}

//CREATING A WIDGET FROM SCRATCH EXAMPLE

class RoundIconButton extends StatelessWidget {
  RoundIconButton({@required this.icon, @required this.onPressed});

  final IconData icon;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(this.icon),
      onPressed: this.onPressed,
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      elevation: 0.0,
    );
  }
}
