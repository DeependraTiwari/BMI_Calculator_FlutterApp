import 'package:flutter/material.dart';
import '../utils/bmi_calculator.dart';

class BMIProvider extends ChangeNotifier {
  double bmi = 0;
  bool isDarkMode = false;

  String category = "";
  String suggestion = "";

  void calculateBMI(double heightMeters, double weightKg) {
    bmi = BMICalculator.calculate(heightMeters, weightKg);

    if (bmi < 18.5) {
      category = "Underweight";
      suggestion = "You may need to gain some healthy weight.";
    } else if (bmi < 25) {
      category = "Normal";
      suggestion = "Your BMI is in the healthy range.";
    } else {
      category = "Overweight";
      suggestion = "Consider lifestyle adjustments.";
    }

    notifyListeners();
  }

  void toggleTheme() {
    isDarkMode = !isDarkMode;
    notifyListeners();
  }

  void reset() {
    bmi = 0;
    category = "";
    suggestion = "";
    notifyListeners();
  }
}