import 'package:flutter/material.dart';
import 'package:alterlearning/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AlterLearning',
      theme: ThemeData(
        primaryColor: Color(0xFF1FC49A),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Home(title: 'AlterLearning',),
    );
  }
}

