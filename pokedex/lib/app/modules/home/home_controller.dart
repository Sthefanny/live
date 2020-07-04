import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:mobx/mobx.dart';

import '../../common/configs/url_config.dart';
import '../../common/models/pokemons_model.dart';

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final Dio _client;

  _HomeControllerBase(this._client);

  @observable
  Pokemons pokemonList = Pokemons();

  @action
  Future<void> getPokemon() async {
    try {
      var result = await _client.get(UrlConfig.pokedexUrl);
      if (result.statusCode == 200) {
        pokemonList = Pokemons.fromJson(jsonDecode(result.data));
      }
    } catch (e) {
      print('erro: $e');
    }
  }
}
