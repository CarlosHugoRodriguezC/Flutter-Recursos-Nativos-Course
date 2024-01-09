import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part "app_state_provider.g.dart";

@Riverpod(keepAlive: true)
class AppState extends _$AppState {
  @override
  AppLifecycleState build() {
    return AppLifecycleState.resumed;
  }

  void setAppState(AppLifecycleState state) {
    state = state;
  }
}
