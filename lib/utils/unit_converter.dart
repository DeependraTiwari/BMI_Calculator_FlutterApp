class UnitConverter {
  static double feetToMeters(double feet) => feet * 0.3048;

  static double inchesToMeters(double inches) => inches * 0.0254;

  static double cmToMeters(double cm) => cm * 0.01;

  static double tonToKg(double ton) => ton * 1000;

  static double feetInchesToMeters(double feet, double inches) {
    return feetToMeters(feet) + inchesToMeters(inches);
  }
}