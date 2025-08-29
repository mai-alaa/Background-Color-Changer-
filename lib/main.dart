
import 'package:flutter/material.dart';
import 'package:test_app/color_changer_screen.dart';
// ignore_for_file: prefer-match-file-name

/// The main function is the entry point of the Flutter application.
void main() {
  runApp(const TestApp());
}

/// The TestApp widget is the root of the application.
class TestApp extends StatelessWidget {
  /// Creates an instance of TestApp.
  const TestApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ColorChangerScreen(),
    );
  }
}
