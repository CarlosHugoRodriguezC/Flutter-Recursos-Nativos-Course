import 'package:miscelaneos/domain/domain.dart';

abstract class LocalDbRepository {
  Future<List<Pokemon>> loadPokemons();

  Future<int> pokemnosCount();

  Future<void> insertPokemon(Pokemon pokemon);
}
