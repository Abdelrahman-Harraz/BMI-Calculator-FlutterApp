import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:uuid/uuid.dart';

import 'package:shared_preferences/shared_preferences.dart';

class AuthController extends GetxController {
  String? _userId;

  Future<void> signInAnonymously() async {
    final prefs = await SharedPreferences.getInstance();
    _userId = prefs.getString('userId');

    if (_userId == null) {
      try {
        _userId = Uuid().v4();
        prefs.setString('userId', _userId!);
        print('User ID: $_userId');
      } catch (e) {
        print('Error signing in anonymously: $e');
      }
    }
  }

  String? get userId => _userId;
}
