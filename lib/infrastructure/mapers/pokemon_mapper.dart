import 'package:miscelaneos/domain/domain.dart';
import 'package:miscelaneos/infrastructure/models/pokeapi_pokemon_response.dart';

class PokemonMapper {
  static Pokemon pokeApiPokemonToEntity(Map<String, dynamic> json) {
    final pokeApiPokemon = PokeapiPokemonResponse.fromJson(json);

    final spriteFront = pokeApiPokemon.sprites.other?.home.frontDefault ??
        pokeApiPokemon.sprites.frontDefault;

    return Pokemon(
      id: pokeApiPokemon.id,
      name: pokeApiPokemon.name,
      spriteFront: spriteFront,
    );
  }
}
