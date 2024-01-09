import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'admob_points_provider.g.dart';


@Riverpod(keepAlive: true)
class AdMobPoints extends _$AdMobPoints {
  @override
  int build() {
    return 0;
  }

  void addPoints(int points) {
    state += points;
  }
}

