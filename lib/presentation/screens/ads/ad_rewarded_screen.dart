import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:miscelaneos/presentation/providers/providers.dart';

class AdRewardedScreen extends ConsumerWidget {
  const AdRewardedScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final adRewardedAsync = ref.watch(adRewardedProvider);
    final adPoints = ref.watch(adMobPointsProvider);

    ref.listen(adRewardedProvider, (prev, next) {
      if (!next.hasValue) return;
      if (next.value == null) return;

      next.value!.show(
        onUserEarnedReward: (ad, reward) => {
          // print('Reward earned: ${reward.amount} ${reward.type}'),
          ref
              .read(adMobPointsProvider.notifier)
              .addPoints(reward.amount.toInt()),
        },
      );
    });

    if (adRewardedAsync.isLoading) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Ad Rewarded Screen'),
      ),
      body: Center(
        child: Text('Actual points: $adPoints'),
      ),
    );
  }
}
