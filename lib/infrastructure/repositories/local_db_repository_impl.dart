import 'package:miscelaneos/domain/domain.dart';
import 'package:miscelaneos/infrastructure/datasources/isar_local_db_datasource.dart';

class LocalDbRepositoryImpl implements LocalDbRepository {
  final LocalDbDatasource _datasource;

  LocalDbRepositoryImpl({LocalDbDatasource? localDbDataSource})
      : _datasource = localDbDataSource ?? IsarLocalDbDatasource();

  @override
  Future<void> insertPokemon(Pokemon pokemon) {
    return _datasource.insertPokemon(pokemon);
  }

  @override
  Future<List<Pokemon>> loadPokemons() {
    return _datasource.loadPokemons();
  }

  @override
  Future<int> pokemnosCount() {
    return _datasource.pokemnosCount();
  }
}
