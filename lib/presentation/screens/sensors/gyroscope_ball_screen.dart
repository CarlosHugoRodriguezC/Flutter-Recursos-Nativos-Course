import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:miscelaneos/presentation/providers/providers.dart';

class GyroscopeBallScreen extends ConsumerWidget {
  const GyroscopeBallScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final gyroscope$ = ref.watch(gyroscopeProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Giroscopio'),
      ),
      body: SizedBox.expand(
        child: gyroscope$.when(
          data: (value) => MovingBall(x: value.x, y: value.y),
          error: (error, stackTrace) => Text('Error: $error'),
          loading: () => const Center(child: CircularProgressIndicator()),
        ),
      ),
    );
  }
}

class MovingBall extends StatelessWidget {
  const MovingBall({super.key, required this.x, required this.y});

  final double x;
  final double y;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    double screenWidth = size.width - 25;
    double screenHeight = size.height - 25;

    double currentYPos = y * 150;
    double currentXPos = x * 150;

    return Stack(
      alignment: Alignment.center,
      children: [
        Text(
          'X: $x\nY: $y',
          style: const TextStyle(
            fontSize: 40,
          ),
        ),
        AnimatedPositioned(
          duration: const Duration(milliseconds: 1000),
          curve: Curves.easeInOut,
          top: screenHeight / 2 - currentYPos,
          left: screenWidth / 2 - currentXPos,
          child: const Ball(),
        ),
      ],
    );
  }
}

class Ball extends StatelessWidget {
  const Ball({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 50,
      decoration: const BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.all(
          Radius.circular(50),
        ),
      ),
    );
  }
}
