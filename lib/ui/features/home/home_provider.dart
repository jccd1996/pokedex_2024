import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pokedex_2024/core/dependecy_injection.dart';
import 'package:pokedex_2024/core/errors/result.dart';
import 'package:pokedex_2024/domain/model/pokemon.dart';
import 'package:pokedex_2024/domain/repository/pokemon_repository.dart';
import 'package:pokedex_2024/utils/debouncer.dart';

class HomeProvider extends ChangeNotifier {
  final PokemonRepository pokemonRepository = locator<PokemonRepository>();
  List<Pokemon>? pokemonList;
  List<Pokemon>? searchList;
  final debouncer = Debouncer();

  String errorMessage = '';

  Future<void> loadPokemons() async {
    final Result<List<Pokemon>, Exception> result =
        await pokemonRepository.getPokemons();

    result.when(
      (pokemonListResult) {
        pokemonList = pokemonListResult;
        _setInitialList();
      },
      (error) {
        errorMessage = 'Hubo un error en la red, intente de nuevo';
      },
    );

    notifyListeners();
  }

  void _setInitialList() {
    searchList = List<Pokemon>.from(pokemonList ?? []);
  }

  void searchPokemon(String filter) {
    debouncer.execute(() {
      final filterLowerCase = filter.toLowerCase();
      if (filter.isEmpty) {
        _setInitialList();
      } else {
        searchList = List<Pokemon>.from(
          pokemonList!.where((element) =>
              element.name!.toLowerCase().contains(
                    filterLowerCase,
                  ) ||
              element.id!.toLowerCase().contains(filterLowerCase)),
        );
      }
      notifyListeners();
    });
  }
}
