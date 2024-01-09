import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:miscelaneos/config/plugins/admob_plugin.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'admob_providers.g.dart';

@riverpod
Future<BannerAd> adBanner(AdBannerRef ref) async {
  // TODO: validate if the adds will be loaded

  final ad = await AdmobPlugin.loadBannerAd();
  return ad;
}

@riverpod
Future<InterstitialAd> adInterstitial(AdInterstitialRef ref) async {
  // TODO: validate if the adds will be loaded

  final ad = await AdmobPlugin.loadIntertitialAd();
  return ad;
}

@riverpod
Future<RewardedAd> adRewarded(AdRewardedRef ref) async {
  // TODO: validate if the adds will be loaded

  final ad = await AdmobPlugin.loadRewardedAd();
  return ad;
}
