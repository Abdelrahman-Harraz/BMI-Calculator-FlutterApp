import 'package:bmi_calculator/controllers/firestore_controller.dart';
import 'package:bmi_calculator/core/utility/bmi_calculate.dart';
import 'package:bmi_calculator/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BmiController extends GetxController {
  final FirestoreController firestoreController = FirestoreController();

  final weightController = TextEditingController();
  final heightController = TextEditingController();
  final ageController = TextEditingController();

  void submitData() async {
    final weight = double.parse(weightController.text);
    final heightCM = double.parse(heightController.text);
    final age = int.parse(ageController.text);
    final bmi = calculateBMI(weight, heightCM);
    try {
      await firestoreController.addEntry(weight, heightCM, age, bmi);

      weightController.clear();
      heightController.clear();
      ageController.clear();
      Get.toNamed(AppRoutes.entryList);
    } catch (e) {
      print('Error submitting data: $e');
    }
  }

  void updateEntry(String entryId) async {
    final weight = double.parse(weightController.text);
    final height = double.parse(heightController.text);
    final age = int.parse(ageController.text);
    final bmi = calculateBMI(weight, height);

    try {
      await firestoreController.updateEntry(
        entryId,
        weight,
        height,
        age,
        bmi,
      );
      Get.back();
    } catch (e) {
      print('Error updating entry: $e');
    }
  }
}
