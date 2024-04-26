import 'package:bmi_calculator/core/utility/bmi_calculate.dart';
import 'package:bmi_calculator/routes.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class EntryFormScreen extends StatefulWidget {
  @override
  _EntryFormScreenState createState() => _EntryFormScreenState();
}

class _EntryFormScreenState extends State<EntryFormScreen> {
  final _formKey = GlobalKey<FormState>();
  final _weightController = TextEditingController();
  final _heightController = TextEditingController();
  final _ageController = TextEditingController();
  final _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Enter BMI Data'),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              controller: _weightController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Weight (kg)'),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your weight';
                }
                return null;
              },
            ),
            TextFormField(
              controller: _heightController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Height (m)'),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your height';
                }
                return null;
              },
            ),
            TextFormField(
              controller: _ageController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Age'),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your age';
                }
                return null;
              },
            ),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _submitData();
                }
              },
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }

  void _submitData() async {
    final weight = double.parse(_weightController.text);
    final height = double.parse(_heightController.text);
    final age = int.parse(_ageController.text);
    final bmi = calculateBMI(weight, height);

    try {
      await _firestore.collection('entries').add({
        'weight': weight,
        'height': height,
        'age': age,
        'bmi': bmi,
        'timestamp': DateTime.now(),
      });

      // Clear form fields after submission
      _weightController.clear();
      _heightController.clear();
      _ageController.clear();

      Get.toNamed(AppRoutes.entryList);
    } catch (e) {
      print('Error submitting data: $e');
    }
  }
}
