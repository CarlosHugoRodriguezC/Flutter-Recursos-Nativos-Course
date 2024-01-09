import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:miscelaneos/config/config.dart';
import 'package:miscelaneos/domain/domain.dart';
import 'package:miscelaneos/presentation/providers/pokemons/pokemon_provider.dart';

class PokemonScreen extends ConsumerWidget {
  const PokemonScreen({super.key, required this.pokemonId});

  final String pokemonId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pokemonAsync = ref.watch(getPokemonProvider(pokemonId: pokemonId));

    return pokemonAsync.when(
      data: (pokemon) => _PokemonView(pokemon: pokemon),
      loading: () => const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      ),
      error: (error, stackTrace) => Scaffold(
        body: Center(
          child: Text(
            error.toString(),
            style: const TextStyle(color: Colors.red),
          ),
        ),
      ),
    );
  }
}

class _PokemonView extends StatelessWidget {
  const _PokemonView({super.key, required this.pokemon});

  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pokemon ${pokemon.name}'),
        actions: [
          IconButton(
            icon: const Icon(Icons.share_outlined),
            onPressed: () {
              SharePlugin.shareLink(
                'https://micelaneos-cahuroca.pages.dev/pokemons/${pokemon.id}/',
                'Mira este pokemon',
              );
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.network(pokemon.spriteFront),
            Text(
              pokemon.name.toUpperCase(),
              style: const TextStyle(fontSize: 24),
            ),
          ],
        ),
      ),
    );
  }
}
