import 'package:json_annotation/json_annotation.dart';

part 'pokemons_poke_api_model.g.dart';

@JsonSerializable()
class PokeSpecies {
  List<FlavorTextEntries> flavorTextEntries;

  PokeSpecies({this.flavorTextEntries});

  factory PokeSpecies.fromJson(Map<String, dynamic> json) => _$PokeSpeciesFromJson(json);
  Map<String, dynamic> toJson() => _$PokeSpeciesToJson(this);
}

@JsonSerializable()
class FlavorTextEntries {
  String flavorText;
  Color language;
  Color version;

  FlavorTextEntries({this.flavorText, this.language, this.version});

  factory FlavorTextEntries.fromJson(Map<String, dynamic> json) => _$FlavorTextEntriesFromJson(json);
  Map<String, dynamic> toJson() => _$FlavorTextEntriesToJson(this);
}

@JsonSerializable()
class Color {
  String name;
  String url;

  Color({this.name, this.url});

  factory Color.fromJson(Map<String, dynamic> json) => _$ColorFromJson(json);
  Map<String, dynamic> toJson() => _$ColorToJson(this);
}

@JsonSerializable()
class PokeApi {
  int height;
  int weight;

  PokeApi({this.height, this.weight});

  factory PokeApi.fromJson(Map<String, dynamic> json) => _$PokeApiFromJson(json);
  Map<String, dynamic> toJson() => _$PokeApiToJson(this);
}
