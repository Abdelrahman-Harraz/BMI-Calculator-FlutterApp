import 'package:bmi_calculator/controllers/auth_controller.dart';
import 'package:bmi_calculator/models/entry.dart';
import 'package:bmi_calculator/routes.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FirestoreController extends GetxController {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  FirebaseAuth _auth = FirebaseAuth.instance;
  final int _pageSize = 10;
  final Rx<List<Entry>> _entries = Rx<List<Entry>>([]);

  List<Entry> get entries => _entries.value;

  Stream<List<Entry>> get entriesStream {
    final authController = Get.find<AuthController>();
    final userId = authController.userId;
    if (userId == null) return const Stream.empty();

    return _firestore
        .collection('users')
        .doc(userId)
        .collection('entries')
        .orderBy('timestamp', descending: true)
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) =>
                Entry.fromJson(doc.data() as Map<String, dynamic>, doc.id))
            .toList());
  }

  @override
  void onInit() {
    _entries.bindStream(entriesStream);
    super.onInit();
  }

  Future<void> addEntry(
      double weight, double height, int age, double bmi) async {
    final authController = Get.find<AuthController>();
    final userId = authController.userId;
    if (userId == null) return;

    try {
      await _firestore
          .collection('users')
          .doc(userId)
          .collection('entries')
          .add({
        'weight': weight,
        'height': height,
        'age': age,
        'bmi': bmi,
        'timestamp': DateTime.now(),
      });
    } catch (e) {
      print('Error adding entry: $e');
    }
  }

  Future<void> updateEntry(
      String id, double weight, double height, int age, double bmi) async {
    final authController = Get.find<AuthController>();
    final userId = authController.userId;
    if (userId == null) return;

    try {
      await _firestore
          .collection('users')
          .doc(userId)
          .collection('entries')
          .doc(id)
          .update({
        'weight': weight,
        'height': height,
        'age': age,
        'bmi': bmi,
      });
    } catch (e) {
      print('Error updating entry: $e');
    }
  }

  Future<void> deleteEntry(String id) async {
    final authController = Get.find<AuthController>();
    final userId = authController.userId;
    if (userId == null) return;

    try {
      await _firestore
          .collection('users')
          .doc(userId)
          .collection('entries')
          .doc(id)
          .delete();
    } catch (e) {
      print('Error deleting entry: $e');
    }
  }

  Future<void> signOut() async {
    final prefs = await SharedPreferences.getInstance();
    try {
      final userId = prefs.getString('userId');
      if (userId != null) {
        Get.defaultDialog(
          title: 'Confirm Sign Out',
          middleText:
              'Are you sure you want to sign out? All your data will be deleted.',
          textConfirm: 'Yes',
          textCancel: 'No',
          confirmTextColor: Colors.white,
          cancelTextColor: Colors.black,
          onConfirm: () async {
            // Delete user data and sign out
            await _firestore.collection('users').doc(userId).delete();
            await prefs.remove('userId');
            _entries.value = [];
            await _auth.signOut();
            Get.offAllNamed(AppRoutes.signIn); // Navigate to sign-in screen
          },
        );
      } else {
        // If userId is null, just sign out without prompting
        await _auth.signOut();
      }
    } catch (e) {
      print('Error signing out: $e');
    }
  }
}
