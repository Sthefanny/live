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
  PokemonsPokeApi pokemon;

  @action
  Future<void> getPokemon(String num) async {
    try {
      var id = int.parse(num);
      var result = await _client.get('${UrlConfig.pokeApiUrl}$id');
      if (result.statusCode == 200) {
        pokemon = PokemonsPokeApi.fromJson(result.data);
      }
    } catch (e) {
      print('erro: $e');
    }
  }
}
