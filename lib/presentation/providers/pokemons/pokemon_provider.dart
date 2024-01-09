import 'package:miscelaneos/domain/domain.dart';
import 'package:miscelaneos/infrastructure/repositories/pokemons_repository_impl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'pokemon_provider.g.dart';

@riverpod
PokemonsRepository pokemonsRepository(PokemonsRepositoryRef ref) {
  return PokemonsRepositoryImpl();
}

@riverpod
Future<Pokemon> getPokemon(GetPokemonRef ref,
    {required String pokemonId}) async {
  final pokemonRepository = ref.read(pokemonsRepositoryProvider);

  final (pokemon, message) = await pokemonRepository.getPokemon(pokemonId);

  if (pokemon == null) {
    throw Exception(message);
  }

  return pokemon;
}
