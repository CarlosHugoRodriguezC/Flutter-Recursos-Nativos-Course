import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_compass/flutter_compass.dart';

part 'compass_provider.g.dart';

@riverpod
Stream<double?> compass(CompassRef ref) async* {
  if (FlutterCompass.events == null) {
    throw Exception('Compass is not supported on this device');
  }

  try {
    await for (final event in FlutterCompass.events!) {
      yield event.heading;
    }
  } catch (e) {
    throw Exception('Error while getting compass data $e');
  }
}
