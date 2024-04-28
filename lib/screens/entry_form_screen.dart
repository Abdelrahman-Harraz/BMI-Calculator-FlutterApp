import 'package:bmi_calculator/controllers/bmi_controller.dart';
import 'package:bmi_calculator/screens/entry_list_screen.dart';
import 'package:bmi_calculator/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class EntryFormScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
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
                        Get.to(() => EntryListScreen(), arguments: controller);
                      },
                      child: Text(
                        "Go to your previous data >>>",
                        style: OwnTheme.bodyTextStyle().copyWith(
                          color: OwnTheme.red,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
