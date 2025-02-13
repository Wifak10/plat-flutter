import 'package:flutter/material.dart';
import 'screens/breakfast_screen.dart';

void main() {
  runApp(BreakfastScreen());
}

class BreakfastScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BreakfastScreen(),
    );
  }
}