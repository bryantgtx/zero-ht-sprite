import 'package:flutter/material.dart';

class ThemeConstants {
  static const defaultButtonHeight = 45.0;
  static const defaultScreenPadding = 15.0;
  
  static ThemeData theme = ThemeData(
    textTheme: const TextTheme(
      headline1: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.red),
      bodyText2: TextStyle(fontSize: 12, color: Colors.green),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        textStyle: MaterialStateProperty.all(
          const TextStyle(fontSize: 30)
        ),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
        ),
        minimumSize: MaterialStateProperty.all(const Size(200.0, 45.0)),
      ),
    ),
  );
}