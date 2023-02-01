import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'language.g.dart';

@riverpod
class Language extends _$Language {
  @override
  Locale? build() => Locale.fromSubtags(languageCode: 'fr');

  void set(String languageCode) {
    log(languageCode);
    state = Locale.fromSubtags(languageCode: languageCode);
  }
}
