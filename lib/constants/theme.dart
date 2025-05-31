import 'package:flutter/material.dart';

final ThemeData apptheme = ThemeData(
  useMaterial3: true,
  scaffoldBackgroundColor: Colors.white,
  primaryColor: const Color(0xFF92E9FF),
  fontFamily: 'NotoSansJP', // pubspec.yaml にフォント追加してなかったらこれは外してOK
  appBarTheme: const AppBarTheme(
    backgroundColor: Color(0xFF92E9FF),
    centerTitle: true,
    titleTextStyle: TextStyle(
    color: Colors.black,
    fontSize: 20,
    fontWeight: FontWeight.bold,
    ),
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    selectedItemColor: Color(0xFF92E9FF),
    unselectedItemColor: Colors.grey,
    showUnselectedLabels: true,
  ),
  textTheme: const TextTheme(
    bodyMedium: TextStyle(fontSize: 16),
  ),
);
