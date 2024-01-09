import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'badge_counter_provider.g.dart';

@riverpod
class BadgeCount extends _$BadgeCount {
  @override
  int build() {
    return 0;
  }

  void increaseBy({int value = 1}) {
    state = state + value;
  }
}
