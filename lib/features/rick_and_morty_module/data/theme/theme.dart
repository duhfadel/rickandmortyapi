import 'package:flutter/material.dart';

class CustomTheme {
  static ThemeData get darkTheme {
    return ThemeData(
        textTheme: const TextTheme(
          headline1: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          headline2: TextStyle(fontSize: 34, fontFamily: 'get_schwifty'),
          bodyText1: TextStyle(fontWeight: FontWeight.bold),
          bodyText2: TextStyle(fontSize: 11, color: Colors.grey),
        ),
        brightness: Brightness.dark);
  }
}
