class BMICalculator {
  static double calculate(double heightMeters, double weightKg) {
    if (heightMeters <= 0) return 0;
    return weightKg / (heightMeters * heightMeters);
  }
}