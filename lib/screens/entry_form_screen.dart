import 'package:bmi_calculator/controllers/bmi_controller.dart';
import 'package:bmi_calculator/core/utility/bmi_calculate.dart';
import 'package:bmi_calculator/routes.dart';
import 'package:bmi_calculator/screens/entry_list_screen.dart';
import 'package:bmi_calculator/theme.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sizer/sizer.dart';

class EntryFormScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final _firestore = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: GetBuilder<BmiController>(
            builder: (BmiController controller) {
              return Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 60),
                      child: Text('Enter Your BMI Data',
                          style: OwnTheme.buttonTextStyle()
                              .copyWith(color: OwnTheme.callToActionColor)),
                    ),
                    TextFormField(
                      controller: controller.weightController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: 'Weight (kg)',
                        hintText: 'Enter your weight',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        filled: true,
                        fillColor: Colors.grey[200],
                        prefixIcon: Icon(Icons.fitness_center),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your weight';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 2.h),
                    TextFormField(
                      controller: controller.heightController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: 'Height (cm)',
                        hintText: 'Enter your height',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        filled: true,
                        fillColor: Colors.grey[200],
                        prefixIcon: Icon(Icons.height),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your height';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 2.h),
                    TextFormField(
                      controller: controller.ageController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: 'Age',
                        hintText: 'Enter your age',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        filled: true,
                        fillColor: Colors.grey[200],
                        prefixIcon: Icon(Icons.person),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your age';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 2.h),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          controller.submitData();
                        }
                      },
                      style: ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll(
                              OwnTheme.secondaryColor)),
                      child: Text('Submit',
                          style: OwnTheme.buttonTextStyle()
                              .copyWith(color: OwnTheme.callToActionColor)),
                    ),
                    TextButton(
                        onPressed: () {
                          Get.to(EntryListScreen());
                        },
                        child: Text("Go to your previous data >>>",
                            style: OwnTheme.bodyTextStyle().copyWith(
                                color: OwnTheme.red,
                                fontWeight: FontWeight.bold)))
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  // void _submitData(BmiController controller) async {
  //   final weight = double.parse(controller.weightController.text);
  //   final heightCM =
  //       double.parse(controller.heightController.text); // Parse height in cm
  //   final age = int.parse(controller.ageController.text);
  //   final heightM = heightCM / 100; // Convert height to meters
  //   final bmi =
  //       calculateBMI(weight, heightM); // Use height in meters for calculation
  //   try {
  //     await _firestore.collection('entries').add({
  //       'weight': weight,
  //       'height': heightCM, // Save height in cm to the database
  //       'age': age,
  //       'bmi': bmi,
  //       'timestamp': DateTime.now(),
  //     });
  //     // Clear form fields after submission
  //     controller.weightController.clear();
  //     controller.heightController.clear();
  //     controller.ageController.clear();
  //     Get.toNamed(AppRoutes.entryList);
  //   } catch (e) {
  //     print('Error submitting data: $e');
  //   }
  // }
}
