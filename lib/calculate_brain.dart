import 'dart:math';

class CalculateBrain {
  final int height;
  final int weight;

  double _bmi;

  CalculateBrain({this.height, this.weight});

  String calculateBMI() {
    _bmi = weight / pow(height/100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi >= 25) {
      return 'Overweight';
    } else if (_bmi > 18.5) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }

  String getInterpretation() {
    if (_bmi >= 25) {
      return 'Fat, Exercite more';
    } else if (_bmi > 18.5) {
      return 'You are good you are skin';
    } else {
      return 'Hum, eat more and better';
    }
  }

}