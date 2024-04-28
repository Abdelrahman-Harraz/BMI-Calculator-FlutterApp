import 'package:bmi_calculator/controllers/auth_controller.dart';
import 'package:bmi_calculator/controllers/bmi_controller.dart';
import 'package:bmi_calculator/controllers/firestore_controller.dart';
import 'package:bmi_calculator/routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Get.put(AuthController());
  Get.put(FirestoreController());
  Get.put(BmiController());
  runApp(Sizer(builder: (context, orientation, deviceType) {
    return MyApp();
  }));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'BMI Calculator',
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.signIn,
      getPages: AppRoutes.routes,
    );
  }
}
