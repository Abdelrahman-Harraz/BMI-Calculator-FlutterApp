import 'package:flutter/material.dart';

class AnonymousAuthScreen extends StatelessWidget {
  const AnonymousAuthScreen({super.key});
  static String routeName = "/AnonymousAuthScreen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: Container(
        width: 100,
        height: 100,
        color: Colors.amber,
      ),
    );
  }
}
