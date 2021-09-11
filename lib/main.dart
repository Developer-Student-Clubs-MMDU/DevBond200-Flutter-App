import 'package:flutter/material.dart';
import 'package:todo_android_app/screens/homescreen.dart';


void main() {
  runApp(TodoApp());
}

class TodoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UniversuMM',
      home: HomePage(),
    );
  }
}

