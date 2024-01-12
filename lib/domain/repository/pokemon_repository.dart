import 'package:pokedex_2024/core/dependecy_injection.dart';
import 'package:pokedex_2024/core/errors/result.dart';
import 'package:pokedex_2024/data/api/pokemon_api.dart';
import 'package:pokedex_2024/domain/model/pokemon.dart';

abstract class PokemonRepository {
  Future<Result<List<Pokemon>, Exception>> getPokemons();
}

class PokemonRepositoryAdapter implements PokemonRepository {
  final PokemonApi _api = locator<PokemonApi>();

  @override
  Future<Result<List<Pokemon>, Exception>> getPokemons() {
    return _api.getPokemons();
  }
}
