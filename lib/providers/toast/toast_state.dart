import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'toast_state.g.dart';

@riverpod
class ToastState extends _$ToastState {
  @override
  String? build() => null;

  void set(String? value) {
    state = value;
  }
}
