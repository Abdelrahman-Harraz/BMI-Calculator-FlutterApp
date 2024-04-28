import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:uuid/uuid.dart'; // Import the uuid package

import 'package:shared_preferences/shared_preferences.dart';

class AuthController extends GetxController {
  FirebaseAuth _auth = FirebaseAuth.instance;
  String? _userId;

  Future<void> signInAnonymously() async {
    final prefs = await SharedPreferences.getInstance();
    _userId = prefs.getString('userId');

    if (_userId == null) {
      try {
        final userCredential = await _auth.signInAnonymously();
        final user = userCredential.user;
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
