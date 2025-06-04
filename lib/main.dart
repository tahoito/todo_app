import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'constants/theme.dart';

void main() {
  runApp(const ToDoApp());
}

class ToDoApp extends StatelessWidget {
  const ToDoApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'todo_app',
      theme: appTheme,
      home: const HomeScreen(),
    );
  }
}