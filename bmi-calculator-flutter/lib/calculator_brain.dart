import 'dart:math';

class CalculatorBrain {
  final int height;

  final int weight;

  double _BMI;

  CalculatorBrain({this.height, this.weight});

  String calculateBMI() {
    _BMI = weight / pow(height / 100, 2);

    return _BMI.toStringAsFixed(
        1); //returns as a string and rounds to the specified number of digits
  }

  String getResult() {
    if (_BMI >= 25) {
      return "Overweight";
    } else if (_BMI >= 18.5) {
      return "Normal";
    } else {
      return "Underweight";
    }
  }

  String getInterpretation() {
    if (_BMI >= 25) {
      return "You are above the recommended amount. Try exercising more.";
    } else if (_BMI >= 18.5) {
      return "You are in the recommended amount. Keep it up!";
    } else {
      return "You are under the recommended amount. Try eating more.";
    }
  }
}
