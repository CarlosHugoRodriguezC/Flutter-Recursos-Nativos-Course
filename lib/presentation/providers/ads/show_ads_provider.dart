import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'show_ads_provider.g.dart';

@riverpod
class ShowAds extends _$ShowAds {
  @override
  bool build() {
    return false;
  }

  void toggleShowAds() {
    state = !state;
  }
}
