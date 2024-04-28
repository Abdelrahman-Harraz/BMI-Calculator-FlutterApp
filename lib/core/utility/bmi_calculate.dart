import 'dart:math';

double calculateBMI(double weight, double heightCM) {
  // Convert height from centimeters to meters
  double heightM = heightCM / 100;

  // Calculate BMI
  double bmi = weight / pow(heightM, 2);

  return bmi;
}
