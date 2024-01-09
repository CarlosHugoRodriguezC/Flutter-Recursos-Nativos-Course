import 'package:flutter/material.dart';
import 'package:flutter_app_badger/flutter_app_badger.dart';

class AppBadgePlugin {
  static Future<bool> isAppBadgeSupported() async {
    return await FlutterAppBadger.isAppBadgeSupported();
  }

  static void updateBadgeCount(int count) async {
    if (!await isAppBadgeSupported()) {
      debugPrint('App Badge is not supported');
      return;
    }

    FlutterAppBadger.updateBadgeCount(count);
  }

  static void removeBadge() async {
    if (!await isAppBadgeSupported()) {
      debugPrint('App Badge is not supported');
      return;
    }

    FlutterAppBadger.removeBadge();
  }
}
