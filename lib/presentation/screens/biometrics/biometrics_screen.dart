import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/providers.dart';

class BiometricsScreen extends ConsumerWidget {
  const BiometricsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final canCheckBiometrics = ref.watch(canCheckBiometricsProvider);
    final localAuthState = ref.watch(localAuthProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Biometrics"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton.tonal(
              onPressed: () {
                ref.read(localAuthProvider.notifier).authenticateUser();
              },
              child: const Text("Authenticate"),
            ),
            canCheckBiometrics.when(
              data: (canCheck) => Text(
                canCheck ? "Biometrics available" : "Biometrics not available",
              ),
              error: (error, stackTrace) => Text(
                error.toString(),
              ),
              loading: () => const Text('Checking biometrics availability...'),
            ),
            const SizedBox(height: 40),
            const Text(
              'State of biometrics',
              style: TextStyle(
                fontSize: 30,
              ),
            ),
            Text(
              'State $localAuthState',
              style: const TextStyle(
                fontSize: 20,
              ),
            )
          ],
        ),
      ),
    );
  }
}
