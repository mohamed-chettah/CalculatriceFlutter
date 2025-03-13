import 'package:flutter/material.dart';
import 'calculator_screen.dart';

void main() {
  runApp(CalculatriceApp());
}

class CalculatriceApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Calculatrice',
      theme: ThemeData.dark(),
      home: CalculatorScreen(),
    );
  }
}
