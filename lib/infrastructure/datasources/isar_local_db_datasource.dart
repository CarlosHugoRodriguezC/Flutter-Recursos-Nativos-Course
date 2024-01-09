import 'package:isar/isar.dart';
import 'package:miscelaneos/domain/domain.dart';
import 'package:path_provider/path_provider.dart';

class IsarLocalDbDatasource implements LocalDbDatasource {
  late Future<Isar> db;

  IsarLocalDbDatasource() {
    db = openIsar();
  }

  Future<Isar> openIsar() async {
    final dir = await getApplicationDocumentsDirectory();

    // final instance = Isar.get(schemas: [PokemonSchema]);

    // if (instance.isOpen) {
    //   return instance;
    // }

    return Isar.open(directory: dir.path, schemas: [PokemonSchema]);
  }

  @override
  Future<void> insertPokemon(Pokemon pokemon) async {
    final isar = await db;

    isar.write((isar) => isar.pokemons.put(pokemon));

    return;
  }

  @override
  Future<List<Pokemon>> loadPokemons() async {
    final isar = await db;

    return isar.pokemons.where().findAll();
  }

  @override
  Future<int> pokemnosCount() async {
    final isar = await db;

    return isar.pokemons.count();
  }
}
