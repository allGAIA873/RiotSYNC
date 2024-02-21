import 'package:flutter/material.dart';
import 'choice_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SRB',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: ChoiceScreen(),
    );
  }
}
