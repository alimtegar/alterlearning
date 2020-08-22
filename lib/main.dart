import 'package:flutter/material.dart';
// import 'package:alterlearning/home.dart';
import 'package:alterlearning/learning_item_details.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AlterLearning',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: LearningItemDetails(title: 'Animal'),
    );
  }
}

