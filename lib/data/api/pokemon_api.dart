import 'package:pokedex_2024/core/errors/exceptions.dart';
import 'package:pokedex_2024/core/errors/result.dart';
import 'package:pokedex_2024/domain/model/pokemon.dart';
import 'package:http/http.dart' as http;

const pokemonAPI =
    'https://gist.githubusercontent.com/hungps/0bfdd96d3ab9ee20c2e572e47c6834c7/raw/pokemons.json';

abstract class PokemonApi {
  Future<Result<List<Pokemon>, Exception>> getPokemons();
}

class PokemonApiAdapter implements PokemonApi {
  @override
  Future<Result<List<Pokemon>, Exception>> getPokemons() async {
    try {
      var url = Uri.parse(pokemonAPI);
      var response = await http.get(url);
      return Success(pokemonFromJson(response.body));
    } on Exception catch (e) {
      return Error(e);
    }
  }
}
