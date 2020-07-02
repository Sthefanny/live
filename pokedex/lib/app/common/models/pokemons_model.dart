import 'package:json_annotation/json_annotation.dart';

part 'pokemons_model.g.dart';

@JsonSerializable()
class Pokemons {
  List<Pokemon> pokemon;

  Pokemons({this.pokemon});

  factory Pokemons.fromJson(Map<String, dynamic> json) => _$PokemonsFromJson(json);
  Map<String, dynamic> toJson() => _$PokemonsToJson(this);
}

@JsonSerializable()
class Pokemon {
  int id;
  String num;
  String name;
  String img;
  List<String> type;
  String height;
  String weight;
  String candy;
  int candyCount;
  String egg;
  double spawnChance;
  double avgSpawns;
  String spawnTime;
  List<double> multipliers;
  List<String> weaknesses;
  List<Evolution> nextEvolution;
  List<Evolution> prevEvolution;

  Pokemon(
      {this.id,
      this.num,
      this.name,
      this.img,
      this.type,
      this.height,
      this.weight,
      this.candy,
      this.candyCount,
      this.egg,
      this.spawnChance,
      this.avgSpawns,
      this.spawnTime,
      this.multipliers,
      this.weaknesses,
      this.nextEvolution,
      this.prevEvolution});

  factory Pokemon.fromJson(Map<String, dynamic> json) => _$PokemonFromJson(json);
  Map<String, dynamic> toJson() => _$PokemonToJson(this);
}

@JsonSerializable()
class Evolution {
  String num;
  String name;

  Evolution({this.num, this.name});

  factory Evolution.fromJson(Map<String, dynamic> json) => _$EvolutionFromJson(json);
  Map<String, dynamic> toJson() => _$EvolutionToJson(this);
}
