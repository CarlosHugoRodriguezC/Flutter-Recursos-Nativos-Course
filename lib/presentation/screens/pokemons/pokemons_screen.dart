import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:miscelaneos/presentation/providers/providers.dart';

class PokemonsScreen extends StatelessWidget {
  const PokemonsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: PokemonsView(),
    );
  }
}

class PokemonsView extends ConsumerStatefulWidget {
  const PokemonsView({super.key});

  @override
  ConsumerState<PokemonsView> createState() => _PokemonsViewState();
}

class _PokemonsViewState extends ConsumerState<PokemonsView> {
  final _scrollController = ScrollController();

  void infiniteScroll() {
    final currentPokemons = ref.read(pokemonIdsProvider);
    if (currentPokemons.length > 400) {
      _scrollController.removeListener(infiniteScroll);
      return;
    }

    if ((_scrollController.position.pixels + 200) >
        _scrollController.position.maxScrollExtent) {
      ref.read(pokemonIdsProvider.notifier).addPokemonIds();
    }
  }

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(infiniteScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: _scrollController,
      slivers: [
        SliverAppBar(
          title: const Text('Pokemons'),
          floating: true,
          backgroundColor: Colors.white.withOpacity(0.8),
        ),
        const _PokemonsGrid(),
      ],
    );
  }
}

class _PokemonsGrid extends ConsumerWidget {
  const _PokemonsGrid({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pokemonsIds = ref.watch(pokemonIdsProvider);

    return SliverGrid.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 2,
        mainAxisSpacing: 2,
      ),
      itemCount: pokemonsIds.length,
      itemBuilder: (context, index) {
        final pokemonId = pokemonsIds[index];
        return GestureDetector(
          onTap: () => context.push('/pokemons/$pokemonId'),
          child: Image.network(
            'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/$pokemonId.png',
          ),
        );
      },
    );
  }
}
