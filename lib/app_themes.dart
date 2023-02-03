import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static final ThemeData light = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      brightness: Brightness.light,
      seedColor: const Color(0xFF734594),
      primary: const Color(0xFF734594),
      secondary: const Color(0xFFDF3A8C),
      background: const Color(0xFFF6F5F7),
      onBackground: const Color(0xFFE7E7E7),
    ),
    textTheme: const TextTheme(
      titleLarge: TextStyle(
        fontFamily: 'SpaceAge',
        color: Color(0xFFF6F5F7),
      ),
      titleMedium: TextStyle(
        color: Color(0xFF3C3C3C),
      ),
      titleSmall: TextStyle(
        color: Color(0xFF3C3C3C),
      ),
      bodySmall: TextStyle(
        color: Color(0xFF3C3C3C),
      ),
      bodyMedium: TextStyle(
        color: Color(0xFF3C3C3C),
      ),
      bodyLarge: TextStyle(
        color: Color(0xFF3C3C3C),
      ),
    ),
  );

  static final ThemeData dark = ThemeData(
    useMaterial3: true,
    primaryColor: const Color(0xFF734594),
    colorScheme: ColorScheme.fromSeed(
      brightness: Brightness.dark,
      seedColor: const Color.fromARGB(255, 115, 69, 148),
      primary: const Color(0xFF734594),
      secondary: const Color(0xFFDF3A8C),
      background: const Color(0xFF1D1B1E),
      onBackground: const Color(0xFF171717),
    ),
    textTheme: const TextTheme(
      titleLarge: TextStyle(fontFamily: 'SpaceAge'),
    ),
  );
}

double responsiveValue(
  BuildContext context, {
  Map<int, double>? bigger,
  double? large,
  double? desktop,
  double? tablet,
  double? phone,
}) {
  final width = MediaQuery.of(context).size.width;

  if (bigger != null) {
    for (int k in bigger.keys) {
      if (width > k) {
        return bigger[k]!;
      }
    }
  }
  if (large != null && width > 1600) return large;
  if (desktop != null && width > 1024) return desktop;
  if (tablet != null && width > 600) return tablet;
  return phone ?? 0;
}
