import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sensors_plus/sensors_plus.dart';

part 'accelerometer_provider.g.dart';

class AccelerometerXYZ {
  final double x;
  final double y;
  final double z;

  const AccelerometerXYZ({
    required this.x,
    required this.y,
    required this.z,
  });

  @override
  String toString() => '''
    AccelerometerXYZ(
      x: $x, 
      y: $y, 
      z: $z
    )
  ''';
}

@riverpod
Stream<AccelerometerXYZ> accelerometerGravity(
  AccelerometerGravityRef ref,
) async* {
  await for (final event in accelerometerEventStream()) {
    final x = double.parse(event.x.toStringAsFixed(2));
    final y = double.parse(event.y.toStringAsFixed(2));
    final z = double.parse(event.z.toStringAsFixed(2));

    yield AccelerometerXYZ(
      x: x,
      y: y,
      z: z,
    );
  }
}

@riverpod
Stream<AccelerometerXYZ> accelerometerUser(
  AccelerometerUserRef ref,
) async* {
  await for (final event in userAccelerometerEventStream()) {
    final x = double.parse(event.x.toStringAsFixed(2));
    final y = double.parse(event.y.toStringAsFixed(2));
    final z = double.parse(event.z.toStringAsFixed(2));

    yield AccelerometerXYZ(
      x: x,
      y: y,
      z: z,
    );
  }
}
