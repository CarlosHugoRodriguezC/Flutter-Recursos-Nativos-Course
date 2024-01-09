import 'package:miscelaneos/infrastructure/infrastructure.dart';
import 'package:workmanager/workmanager.dart';

const fetchBackgroundTaskKey = 'com.cahuroca.miscelaneos.fetchBackgroundTask';
const fetchPeriodicBackgroundTaskKey =
    'com.cahuroca.miscelaneos.fetchPeriodicBackgroundTask';

@pragma(
    'vm:entry-point') // Mandatory if the App is obfuscated or using Flutter 3.1+
void callbackDispatcher() {
  Workmanager().executeTask((task, inputData) async {
    switch (task) {
      case fetchBackgroundTaskKey:
        await loadNextPokemon();
        break;
      case fetchPeriodicBackgroundTaskKey:
        print('fetchPeriodicBackgroundTaskKey');
        break;
      case Workmanager.iOSBackgroundTask:
        print('iOSBackgroundTask');
        break;
    }

    return true;
  });
}

Future loadNextPokemon() async {
  final localDbRepository = LocalDbRepositoryImpl();
  final pokemonRepository = PokemonsRepositoryImpl();

  final lastPokemonId = await localDbRepository.pokemnosCount() + 1;

  try {
    final (pokemon, message) =
        await pokemonRepository.getPokemon(lastPokemonId.toString());

    if (pokemon == null) {
      throw message;
    }

    await localDbRepository.insertPokemon(pokemon);
    print('Pokemon $lastPokemonId inserted');
  } catch (e) {
    print('Pokemon Error: $e');
  }
}
