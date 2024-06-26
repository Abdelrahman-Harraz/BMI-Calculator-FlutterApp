import 'package:bmi_calculator/controllers/bmi_controller.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator/models/bmi_model.dart';
import 'package:get/get.dart';

class EditEntryData extends StatelessWidget {
  final BmiModel entry;
  final _formKey = GlobalKey<FormState>();
  final BmiController _bmiController = Get.find<BmiController>();

  EditEntryData({super.key, required this.entry}) {
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
