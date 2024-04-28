import 'package:bmi_calculator/controllers/entry_list_controller.dart';
import 'package:bmi_calculator/models/entry.dart';
import 'package:bmi_calculator/routes.dart';
import 'package:bmi_calculator/screens/edit_entry_screen.dart';
import 'package:bmi_calculator/widgets/bmi_gauge.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class EntryListScreen extends StatelessWidget {
  final EntryListController _entryListController =
      Get.put(EntryListController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI List'),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              _entryListController.firestoreController.signOut();
              Get.toNamed(AppRoutes.signIn);
            },
          ),
        ],
      ),
      body: Obx(() {
        if (_entryListController.entries.isEmpty &&
            _entryListController.isLoading) {
          return Center(child: CircularProgressIndicator());
        } else if (_entryListController.entries.isEmpty &&
            _entryListController.hasError) {
          return Center(
              child: Text('Error: ${_entryListController.errorMessage}'));
        } else {
          return ListView.builder(
            itemCount: _entryListController.paginatedEntries.length,
            itemBuilder: (context, index) {
              final entry = _entryListController.paginatedEntries[index];
              return Card(
                margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                elevation: 4,
                child: Column(
                  children: [
                    ListTile(
                      contentPadding: EdgeInsets.all(16),
                      title: Text(
                        'BMI: ${entry.bmi.toStringAsFixed(2)}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16.sp,
                        ),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 4),
                          Text(
                            'Weight: ${entry.weight.toStringAsFixed(1)} kg',
                            style: TextStyle(fontSize: 14.sp),
                          ),
                          Text(
                            'Height: ${entry.height} cm',
                            style: TextStyle(fontSize: 14.sp),
                          ),
                          Text(
                            'Age: ${entry.age}',
                            style: TextStyle(fontSize: 14.sp),
                          ),
                        ],
                      ),
                      trailing: IconButton(
                        icon: Icon(Icons.delete, size: 22.sp),
                        onPressed: () {
                          _entryListController.firestoreController
                              .deleteEntry(entry.id);
                        },
                      ),
                      onTap: () {
                        Get.to(EditEntryData(entry: entry));
                      },
                    ),
                    Padding(
                      padding: EdgeInsets.all(8),
                      child: SizedBox(
                        height: 50.h,
                        child: BMIGauge(bmi: entry.bmi),
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        }
      }),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _entryListController.currentPage.value,
        onTap: (index) {
          if (index == 0) {
            _entryListController.previousPage();
          } else if (index == 1) {
            _entryListController.nextPage();
          }
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.arrow_back),
            label: 'Previous',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.arrow_forward),
            label: 'Next',
          ),
        ],
      ),
    );
  }
}
