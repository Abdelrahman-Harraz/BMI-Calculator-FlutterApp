// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bmi_calculator/controllers/firestore_controller.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:bmi_calculator/models/entry.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';

class EditEntryData extends StatefulWidget {
  final Entry entry;
  EditEntryData({
    Key? key,
    required this.entry,
  }) : super(key: key);

  @override
  State<EditEntryData> createState() => _EditEntryDataState();
}

class _EditEntryDataState extends State<EditEntryData> {
  final _formKey = GlobalKey<FormState>();
  final _weightController = TextEditingController();
  final _heightController = TextEditingController();
  final _ageController = TextEditingController();
  final _firestoreController = Get.find<FirestoreController>();
  @override
  void initState() {
    _weightController.text = widget.entry.weight.toString();
    _heightController.text = widget.entry.height.toString();
    _ageController.text = widget.entry.age.toString();
    super.initState();
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
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
                    _updateEntry();
                  }
                },
                child: Text('Save Changes'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _updateEntry() {
    final weight = double.parse(_weightController.text);
    final height = double.parse(_heightController.text);
    final age = int.parse(_ageController.text);
    final bmi = weight / (height * height);

    _firestoreController.updateEntry(
      widget.entry.id,
      weight,
      height,
      age,
      bmi,
    );

    Get.back(); // Navigate back to previous screen
  }
}
