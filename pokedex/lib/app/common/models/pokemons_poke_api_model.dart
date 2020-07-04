import 'package:json_annotation/json_annotation.dart';

part 'pokemons_poke_api_model.g.dart';

@JsonSerializable()
class PokemonsPokeApi {
  List<Abilities> abilities;
  int baseExperience;
  List<GameIndices> gameIndices;
  int height;
  int id;
  bool isDefault;
  String locationAreaEncounters;
  List<Moves> moves;
  String name;
  int order;
  Ability species;
  List<Stats> stats;
  List<Types> types;
  int weight;

  PokemonsPokeApi(
      {this.abilities,
      this.baseExperience,
      this.gameIndices,
      this.height,
      this.id,
      this.isDefault,
      this.locationAreaEncounters,
      this.moves,
      this.name,
      this.order,
      this.species,
      this.stats,
      this.types,
      this.weight});

  factory PokemonsPokeApi.fromJson(Map<String, dynamic> json) => _$PokemonsPokeApiFromJson(json);
  Map<String, dynamic> toJson() => _$PokemonsPokeApiToJson(this);
}

@JsonSerializable()
class Abilities {
  Ability ability;
  bool isHidden;
  int slot;

  Abilities({this.ability, this.isHidden, this.slot});

  factory Abilities.fromJson(Map<String, dynamic> json) => _$AbilitiesFromJson(json);
  Map<String, dynamic> toJson() => _$AbilitiesToJson(this);
}

@JsonSerializable()
class Ability {
  String name;
  String url;

  Ability({this.name, this.url});

  factory Ability.fromJson(Map<String, dynamic> json) => _$AbilityFromJson(json);
  Map<String, dynamic> toJson() => _$AbilityToJson(this);
}

@JsonSerializable()
class GameIndices {
  int gameIndex;
  Ability version;

  GameIndices({this.gameIndex, this.version});

  factory GameIndices.fromJson(Map<String, dynamic> json) => _$GameIndicesFromJson(json);
  Map<String, dynamic> toJson() => _$GameIndicesToJson(this);
}

@JsonSerializable()
class Moves {
  Ability move;
  List<VersionGroupDetails> versionGroupDetails;

  Moves({this.move, this.versionGroupDetails});

  factory Moves.fromJson(Map<String, dynamic> json) => _$MovesFromJson(json);
  Map<String, dynamic> toJson() => _$MovesToJson(this);
}

@JsonSerializable()
class VersionGroupDetails {
  int levelLearnedAt;
  Ability moveLearnMethod;
  Ability versionGroup;

  VersionGroupDetails({this.levelLearnedAt, this.moveLearnMethod, this.versionGroup});

  factory VersionGroupDetails.fromJson(Map<String, dynamic> json) => _$VersionGroupDetailsFromJson(json);
  Map<String, dynamic> toJson() => _$VersionGroupDetailsToJson(this);
}

@JsonSerializable()
class Stats {
  int baseStat;
  int effort;
  Ability stat;

  Stats({this.baseStat, this.effort, this.stat});

  factory Stats.fromJson(Map<String, dynamic> json) => _$StatsFromJson(json);
  Map<String, dynamic> toJson() => _$StatsToJson(this);
}

@JsonSerializable()
class Types {
  int slot;
  Ability type;

  Types({this.slot, this.type});

  factory Types.fromJson(Map<String, dynamic> json) => _$TypesFromJson(json);
  Map<String, dynamic> toJson() => _$TypesToJson(this);
}
