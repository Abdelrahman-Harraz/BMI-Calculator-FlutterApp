// lib/screens/sign_in_screen.dart

import 'package:bmi_calculator/controllers/auth_controller.dart';
import 'package:bmi_calculator/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignInScreen extends StatelessWidget {
  final AuthController _authController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign In'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            print('Sign-in button pressed');
            _authController.signInAnonymously();
            Get.toNamed(AppRoutes.entryForm);
          },
          child: Text('Sign In Anonymously'),
        ),
      ),
    );
  }
}
