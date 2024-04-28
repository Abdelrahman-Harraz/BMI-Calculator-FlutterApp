// FirestoreController.dart

import 'package:bmi_calculator/models/entry.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class FirestoreController extends GetxController {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  FirebaseAuth _auth = FirebaseAuth.instance;
  final int _pageSize = 10;
  final Rx<List<Entry>> _entries = Rx<List<Entry>>([]);
  List<Entry> get entries => _entries.value;

  Stream<List<Entry>> get entriesStream => _firestore
      .collection('entries')
      .orderBy('timestamp', descending: true)
      .snapshots()
      .map((snapshot) => snapshot.docs
          .map((doc) =>
              Entry.fromJson(doc.data() as Map<String, dynamic>, doc.id))
          .toList());

  @override
  void onInit() {
    _entries.bindStream(entriesStream);
    super.onInit();
  }

  Future<void> addEntry(
      double weight, double height, int age, double bmi) async {
    try {
      await _firestore.collection('entries').add({
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
    try {
      await _firestore.collection('entries').doc(id).update({
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
    try {
      await _firestore.collection('entries').doc(id).delete();
    } catch (e) {
      print('Error deleting entry: $e');
    }
  }

  Future<void> signOut() async {
    try {
      await _auth.signOut();
    } catch (e) {
      print('Error signing out: $e');
    }
  }
}
