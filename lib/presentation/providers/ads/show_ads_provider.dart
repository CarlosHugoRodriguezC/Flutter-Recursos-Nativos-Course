import 'package:miscelaneos/config/config.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'show_ads_provider.g.dart';

const storeKey = 'showAds';

@riverpod
class ShowAds extends _$ShowAds {
  @override
  bool build() {
    checkAdsState();
    return false;
  }

  void checkAdsState() async {
    state = await SharedPreferencesPlugin.getBool(storeKey) ?? true;
  }

  void showAds() {
    SharedPreferencesPlugin.setBool(storeKey, true);
    state = true;
  }

  void removeAds() {
    SharedPreferencesPlugin.setBool(storeKey, false);
    state = false;
  }

  void toggleAds() {
    state ? removeAds() : showAds();
  }
}
