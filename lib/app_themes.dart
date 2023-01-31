import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static final ThemeData light = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color.fromARGB(255, 115, 69, 148),
      brightness: Brightness.light,
    ),
  );

  static final ThemeData dark = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color.fromARGB(255, 115, 69, 148),
      brightness: Brightness.dark,
    ),
  );
}
