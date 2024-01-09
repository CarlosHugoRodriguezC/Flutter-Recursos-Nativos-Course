import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'pokemon_list_provider.g.dart';

@riverpod
class PokemonIds extends _$PokemonIds {
  @override
  List<int> build() {
    return List.generate(30, (index) => index + 1);
  }

  addPokemonIds({int quantity = 30}) {
    final currentPokemons = state;
    final lastPokemonId = currentPokemons.last;
    final newPokemons =
        List.generate(quantity, (index) => lastPokemonId + index);
    state = [...currentPokemons, ...newPokemons];
  }
}
