import 'package:flutter/material.dart';
import 'package:miscelaneos/config/config.dart';
import 'package:miscelaneos/domain/domain.dart';
import 'package:workmanager/workmanager.dart';

class DbPokemonsScreen extends StatelessWidget {
  const DbPokemonsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Background Process'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add_alarm_sharp),
            onPressed: () {
              Workmanager().registerOneOffTask(
                fetchBackgroundTaskKey,
                fetchBackgroundTaskKey,
                initialDelay: const Duration(seconds: 3),
                inputData: {'howMany': 30},
              );
            },
          ),
        ],
      ),
      body: CustomScrollView(
        slivers: [
          _PokemonsGrid(
            pokemons: [],
          )
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        heroTag: 'activateFetch',
        onPressed: () {},
        label: const Text(
          'Activate periodic fetch',
        ),
        icon: const Icon(
          Icons.av_timer,
        ),
      ),
    );
  }
}

class _PokemonsGrid extends StatelessWidget {
  const _PokemonsGrid({
    this.pokemons = const [],
  });

  final List<Pokemon> pokemons;

  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 2,
        mainAxisSpacing: 2,
      ),
      itemCount: pokemons.length,
      itemBuilder: (context, index) {
        final pokemon = pokemons[index];
        return Column(
          children: [
            Image.network(
              pokemon.spriteFront,
              fit: BoxFit.contain,
            ),
            Text(pokemon.name),
          ],
        );
      },
    );
  }
}
