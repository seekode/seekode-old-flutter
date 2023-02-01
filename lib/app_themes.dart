import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static final ThemeData light = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      brightness: Brightness.light,
      seedColor: const Color(0xFF734594),
      primary: const Color(0xFF734594),
      background: const Color(0xFFF6F5F7),
    ),
  );

  static final ThemeData dark = ThemeData(
    useMaterial3: true,
    primaryColor: const Color(0xFF734594),
    colorScheme: ColorScheme.fromSeed(
      brightness: Brightness.dark,
      seedColor: const Color.fromARGB(255, 115, 69, 148),
      primary: const Color(0xFF734594),
      background: const Color(0xFF1D1B1E),
    ),
  );
}
