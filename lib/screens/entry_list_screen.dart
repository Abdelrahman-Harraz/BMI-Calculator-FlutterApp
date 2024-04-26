import 'package:bmi_calculator/controllers/firestore_controller.dart';
import 'package:bmi_calculator/models/entry.dart';
import 'package:bmi_calculator/routes.dart';
import 'package:bmi_calculator/screens/edit_entry_screen.dart';
import 'package:bmi_calculator/widgets/bmi_gauge.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EntryListScreen extends StatelessWidget {
  final FirestoreController _firestoreController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Entry List'),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              _firestoreController.signOut();
              Get.toNamed(AppRoutes.signIn);
            },
          ),
        ],
      ),
      body: StreamBuilder<List<Entry>>(
        stream: _firestoreController.entriesStream,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          final entries = snapshot.data ?? [];
          return ListView.builder(
            itemCount: entries.length,
            itemBuilder: (context, index) {
              final entry = entries[index];
              return ListTile(
                title: Text('BMI: ${entry.bmi}'),
                subtitle: Text(
                    'Weight: ${entry.weight} kg, Height: ${entry.height} m, Age: ${entry.age}'),
                trailing: IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    _firestoreController.deleteEntry(entry.id);
                  },
                ),
                onTap: () {
                  // Navigate to edit screen
                  Get.to(EditEntryData(entry: entry));
                },
                leading: SizedBox(
                  width: 100,
                  child:
                      BMIGauge(bmi: entry.bmi), // Display the BMIGauge widget
                ),
              );
            },
          );
        },
      ),
    );
  }
}
