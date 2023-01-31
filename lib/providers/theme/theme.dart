import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'theme.g.dart';

@riverpod
class Theme extends _$Theme {
  @override
  ThemeMode build() => ThemeMode.system;

  void toogle() {
    switch (state) {
      case ThemeMode.system:
        state = ThemeMode.light;
        break;
      case ThemeMode.light:
        state = ThemeMode.dark;
        break;
      default:
        state = ThemeMode.system;
        break;
    }
  }
}
