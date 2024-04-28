// lib/screens/sign_in_screen.dart

import 'package:bmi_calculator/controllers/auth_controller.dart';
import 'package:bmi_calculator/routes.dart';
import 'package:bmi_calculator/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class SignInScreen extends StatelessWidget {
  final AuthController _authController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: OwnTheme.backgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/bmiLogo.png',
              width: 50.w,
            ),
            SizedBox(height: 5.h),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor:
                    MaterialStatePropertyAll(OwnTheme.secondaryColor),
              ),
              onPressed: () async {
                print('Sign-in button pressed');
                await _authController.signInAnonymously();
                if (_authController.userId != null) {
                  Get.offNamed(AppRoutes.entryForm);
                } else {
                  // Handle sign-in error
                }
              },
              child: Text(
                'Sign In Anonymously',
                style: OwnTheme.buttonTextStyle().copyWith(
                  color: OwnTheme.callToActionColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
