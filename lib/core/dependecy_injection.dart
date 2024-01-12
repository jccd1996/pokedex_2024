import 'package:get_it/get_it.dart';
import 'package:pokedex_2024/data/api/pokemon_api.dart';
import 'package:pokedex_2024/domain/repository/pokemon_repository.dart';

final GetIt locator = GetIt.instance;

class DependecyInjection {
  static void registerInjections() {
    locator.registerSingleton<PokemonApi>(PokemonApiAdapter());
    locator.registerSingleton<PokemonRepository>(PokemonRepositoryAdapter());
  }
}
