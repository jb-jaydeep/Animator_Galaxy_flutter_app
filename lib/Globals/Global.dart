import 'package:flutter/material.dart';

class Global {
  static final ThemeData ligth_Theme = ThemeData(
    useMaterial3: true,
    textTheme: TextTheme(
      displayMedium: TextStyle(
        color: Colors.black,
      ),
    ),
    colorScheme: ColorScheme.light(
      brightness: Brightness.light,
      primary: Colors.blue,
      secondary: Colors.white,
    ),
  );

  static final ThemeData dark_Theme = ThemeData(
    useMaterial3: true,
    textTheme: const TextTheme(
      displayMedium: TextStyle(
        color: Colors.white,
      ),
    ),
    colorScheme: const ColorScheme.dark(
      brightness: Brightness.dark,
      primary: Color(0xfff9f9f9),
      secondary: Color(0xfff9f9f9),
    ),
  );
}
