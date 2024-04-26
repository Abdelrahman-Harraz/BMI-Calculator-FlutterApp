import 'package:bmi_calculator/controllers/auth_controller.dart';
import 'package:bmi_calculator/controllers/firestore_controller.dart';
import 'package:bmi_calculator/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart'; // Import Firebase Core

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Firebase
  await Firebase.initializeApp();

  // Initialize AuthController
  Get.put(AuthController());
  Get.put(FirestoreController());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Your App',
      initialRoute: AppRoutes.signIn,
      getPages: AppRoutes.routes,
    );
  }
}
