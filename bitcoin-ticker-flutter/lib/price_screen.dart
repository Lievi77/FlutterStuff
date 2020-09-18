import 'package:flutter/material.dart';
import 'coin_data.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io' show Platform; //ONLY INCLUDE THE PLATFORM CLASS
//use hide instead of show to hide classes

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String dropDownDisplayValue = 'USD';

  DropdownButton createDropdownButton() {
    //LOOP EXAMPLE
    List<DropdownMenuItem<String>> displayValues = [];

    //enhanced for loop in dart
    for (String currency in currenciesList) {
      DropdownMenuItem<String> newCurrency = DropdownMenuItem(
        child: Text(currency),
        value: currency,
      );

      displayValues.add(newCurrency);
    }

    //EXAMPLE FOR MATERIAL DROPDOWN IN ANDROID
    DropdownButton androidDisplay = DropdownButton<String>(
//to display a dropdown for selection of input
//also need to specify the generic type

      value: dropDownDisplayValue,

      items: displayValues,
      onChanged: (value) {
//it is essential to specify the value in the parenthesis

        setState(() {
          dropDownDisplayValue = value;
        });
      },
    );

    return androidDisplay;
  }

  CupertinoPicker createCupertinoPicker() {
    List<Text> currencyOptions = [];

    for (String currency in currenciesList) {
      Text option = Text(currency);

      currencyOptions.add(option);
    }

    CupertinoPicker iosDisplay = CupertinoPicker(
      backgroundColor: Colors.lightBlue,
      itemExtent: 32.0,
      onSelectedItemChanged: (selectedIndex) {
        //note how you are given an index instead of a value
        print(selectedIndex);
      },
      children: currencyOptions,
    );

    return iosDisplay;
  }

  Widget getPicker() {
    if (Platform.isIOS) {
      return createCupertinoPicker();
    } else if (Platform.isAndroid) {
      return createDropdownButton();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: Card(
              color: Colors.lightBlueAccent,
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                child: Text(
                  '1 BTC = ? USD',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child:
                getPicker(), //HOW TO CHECK WHETHER THE APP IS ON ANDROID OR IOS
          ),
        ],
      ),
    );
  }
}
