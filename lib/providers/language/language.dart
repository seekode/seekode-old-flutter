import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'language.g.dart';

@riverpod
class Language extends _$Language {
  @override
  Locale? build() => null;

  void set(String languageCode) =>
      state = Locale.fromSubtags(languageCode: languageCode);
}
