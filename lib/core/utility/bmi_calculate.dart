import 'dart:math';

double calculateBMI(double weight, double heightCM) {
  double heightM = heightCM / 100;

  double bmi = weight / pow(heightM, 2);

  return bmi;
}
