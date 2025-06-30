import 'package:flutter_riverpod/flutter_riverpod.dart';

enum LoginState {
  initial,
  loading,
  success,
  error,
}

final loginStateProvider =
    StateProvider<LoginState>((ref) => LoginState.initial);

final loginErrorProvider = StateProvider<String?>((ref) => null);

final isLoadingProvider = StateProvider<bool>((ref) => false);
