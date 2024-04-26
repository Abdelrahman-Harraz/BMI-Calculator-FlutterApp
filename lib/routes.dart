// routes.dart

import 'package:bmi_calculator/screens/entry_form_screen.dart';
import 'package:bmi_calculator/screens/entry_list_screen.dart';
import 'package:bmi_calculator/screens/sign_in_screen.dart';
import 'package:get/get.dart';

class AppRoutes {
  static const String signIn = '/sign-in';
  static const String entryForm = '/entry-form';
  static const String entryList = '/entry-list';

  static final routes = [
    GetPage(name: signIn, page: () => SignInScreen()),
    GetPage(name: entryForm, page: () => EntryFormScreen()),
    GetPage(name: entryList, page: () => EntryListScreen()),
  ];
}
