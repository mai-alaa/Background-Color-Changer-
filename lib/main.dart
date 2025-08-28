import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const TestApp());
}

class TestApp extends StatelessWidget {
  const TestApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     debugShowCheckedModeBanner: false,
      home: const ColorChangerScreen(),
    );
  }
}

class ColorChangerScreen extends StatefulWidget {
  const ColorChangerScreen({super.key});

  @override
  State<ColorChangerScreen> createState() => _ColorChangerScreenState();
}

class _ColorChangerScreenState extends State<ColorChangerScreen> {
  Random random = Random();
  Color backgroundColor = Colors.white;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          backgroundColor = Color.fromARGB(
            255,
            random.nextInt(256),
            random.nextInt(256),
            random.nextInt(256),
          );
        });
        
      },
      child: Scaffold(
        backgroundColor: backgroundColor,
        body:  Center(
          child: Text(
            'Hey there',
            style: TextStyle(
              fontSize: 30,
              color: backgroundColor.computeLuminance() > 0.5
                  ? Colors.black
                  : Colors.white,
            ),
          ),
        ),
        
      ),
    )
    ;
  }
}