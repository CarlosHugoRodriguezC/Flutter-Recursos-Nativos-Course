// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_auth_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$canCheckBiometricsHash() =>
    r'9551e4f8333b22fffe1ab69a30551826a7920cc4';

/// See also [canCheckBiometrics].
@ProviderFor(canCheckBiometrics)
final canCheckBiometricsProvider = AutoDisposeFutureProvider<bool>.internal(
  canCheckBiometrics,
  name: r'canCheckBiometricsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$canCheckBiometricsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef CanCheckBiometricsRef = AutoDisposeFutureProviderRef<bool>;
String _$localAuthHash() => r'affac0435dc8c139175f4796b2191f4ddf0a5a54';

/// See also [LocalAuth].
@ProviderFor(LocalAuth)
final localAuthProvider =
    AutoDisposeNotifierProvider<LocalAuth, LocalAuthState>.internal(
  LocalAuth.new,
  name: r'localAuthProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$localAuthHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$LocalAuth = AutoDisposeNotifier<LocalAuthState>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
