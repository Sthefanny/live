import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:mobx/mobx.dart';
import '../../common/models/pokemons_model.dart';

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  Future<String> _loadFromAsset() async {
    return await rootBundle.loadString("assets/json/pokemon.json");
  }

  @action
  Future<Pokemons> getPokemon() async {
    String jsonString = await _loadFromAsset();
    var model = Pokemons.fromJson(jsonDecode(jsonString));
    return model;
  }
}
