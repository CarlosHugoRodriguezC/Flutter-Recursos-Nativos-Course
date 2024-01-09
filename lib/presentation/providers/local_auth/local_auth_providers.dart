import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:miscelaneos/config/config.dart';

part 'local_auth_providers.g.dart';

@riverpod
Future<bool> canCheckBiometrics(CanCheckBiometricsRef ref) async {
  return await LocalAuthPlugin.canCheckBiometrics();
}

enum LocalAuthStatus {
  authenticated,
  notAuthenticated,
  authenticating,
}

class LocalAuthState {
  LocalAuthState({
    this.didAuthenticate = false,
    this.status = LocalAuthStatus.notAuthenticated,
    this.message = '',
  });

  final bool didAuthenticate;
  final LocalAuthStatus status;
  final String message;

  LocalAuthState copyWith({
    bool? didAuthenticate,
    LocalAuthStatus? status,
    String? message,
  }) =>
      LocalAuthState(
        didAuthenticate: didAuthenticate ?? this.didAuthenticate,
        status: status ?? this.status,
        message: message ?? this.message,
      );

  @override
  String toString() {
    return '''

      didAuthenticate: $didAuthenticate,
      status: ${status.toString().split('.').last},
      message: $message,
    ''';
  }
}

@riverpod
class LocalAuth extends _$LocalAuth {
  @override
  LocalAuthState build() {
    return LocalAuthState();
  }

  Future<(bool, String)> authenticateUser() async {
    final (didAuthenticate, message) = await LocalAuthPlugin.authenticate();

    state = state.copyWith(
      didAuthenticate: didAuthenticate,
      message: message,
      status: didAuthenticate
          ? LocalAuthStatus.authenticated
          : LocalAuthStatus.notAuthenticated,
    );

    return (didAuthenticate, message);
  }
}
