// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bmi_calculator/controllers/bmi_controller.dart';
import 'package:bmi_calculator/core/utility/bmi_calculate.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:bmi_calculator/models/entry.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';

class EditEntryData extends StatelessWidget {
  final Entry entry;
  final _formKey = GlobalKey<FormState>();
  final BmiController _bmiController = Get.find<BmiController>();

  EditEntryData({Key? key, required this.entry}) : super(key: key) {
    // Set initial values of text controllers
    _bmiController.weightController.text = entry.weight.toString();
    _bmiController.heightController.text = entry.height.toString();
    _bmiController.ageController.text = entry.age.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Entry'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: GetBuilder<BmiController>(
            builder: (BmiController controller) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextFormField(
                    controller: controller.weightController,
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
                    controller: controller.heightController,
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
                    controller: controller.ageController,
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
                        controller.updateEntry(entry.id);
                      }
                    },
                    child: Text('Save Changes'),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
