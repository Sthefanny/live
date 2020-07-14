import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:mobx/mobx.dart';

import '../../common/configs/url_config.dart';
import '../../common/models/pokemons_poke_api_model.dart';

part 'details_controller.g.dart';

class DetailsController = _DetailsControllerBase with _$DetailsController;

abstract class _DetailsControllerBase with Store {
  final Dio _client;

  _DetailsControllerBase(this._client);

  @observable
  PokeSpecies pokemonDetail = PokeSpecies();

  @action
  Future<void> getPokemonDetails(int id) async {
    try {
      var result = await _client.get('${UrlConfig.pokeSpeciesUrl}$id');
      if (result.statusCode == 200) {
        pokemonDetail = PokeSpecies.fromJson(result.data);
      }
    } catch (e) {
      print('erro: $e');
    }
  }
}
