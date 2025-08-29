import 'dart:math';

import 'package:flutter/material.dart';
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

///  change the background color by tapping on the screen.
class ColorChangerScreen extends StatefulWidget {
  /// Creates an instance of ColorChangerScreen.
  const ColorChangerScreen({super.key});

  @override
  State<ColorChangerScreen> createState() => _ColorChangerScreenState();
}

class _ColorChangerScreenState extends State<ColorChangerScreen> {
  static const double textSize = 30;
  static const int maxColorValue = 256;
  static const int alphaValue = 255;
  static const double breakPointluminance = 0.5;
  final Random random = Random();
  Color backgroundColor = Colors.white;
  

  // This method changes the background color to a random color when the screen
  // is tapped.
  void changeBackgroundColor() {
    setState(() {
      backgroundColor = Color.fromARGB(
        alphaValue,
        random.nextInt(maxColorValue),
        random.nextInt(maxColorValue),
        random.nextInt(maxColorValue),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: changeBackgroundColor,
      child: Scaffold(
        backgroundColor: backgroundColor,
        body: Center(
          child: Text(
            'Hey there',
            style: TextStyle(
              fontSize: textSize,
              fontWeight: FontWeight.bold,
              color:
                  // Use a contrasting color for the text based on the 
                  // background color's luminance
                  backgroundColor.computeLuminance() > breakPointluminance
                      ? Colors.black
                      : Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
