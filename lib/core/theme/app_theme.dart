import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      colorScheme: ColorScheme.fromSeed(
        seedColor: Colors.blue,
        brightness: Brightness.light,
      ),
      // Add other theme configurations
      appBarTheme: const AppBarTheme(centerTitle: true, elevation: 0),
      // Add more theme customizations
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      colorScheme: ColorScheme.fromSeed(
        seedColor: Colors.blue,
        brightness: Brightness.dark,
      ),
      // Add other theme configurations
      appBarTheme: const AppBarTheme(centerTitle: true, elevation: 0),
      // Add more theme customizations
    );
  }
}
