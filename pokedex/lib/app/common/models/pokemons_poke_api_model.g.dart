// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemons_poke_api_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PokeSpecies _$PokeSpeciesFromJson(Map<String, dynamic> json) {
  return PokeSpecies(
    flavorTextEntries: (json['flavor_text_entries'] as List)
        ?.map((e) => e == null
            ? null
            : FlavorTextEntries.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$PokeSpeciesToJson(PokeSpecies instance) =>
    <String, dynamic>{
      'flavor_text_entries': instance.flavorTextEntries,
    };

FlavorTextEntries _$FlavorTextEntriesFromJson(Map<String, dynamic> json) {
  return FlavorTextEntries(
    flavorText: json['flavor_text'] as String,
    language: json['language'] == null
        ? null
        : Color.fromJson(json['language'] as Map<String, dynamic>),
    version: json['version'] == null
        ? null
        : Color.fromJson(json['version'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$FlavorTextEntriesToJson(FlavorTextEntries instance) =>
    <String, dynamic>{
      'flavor_text': instance.flavorText,
      'language': instance.language,
      'version': instance.version,
    };

Color _$ColorFromJson(Map<String, dynamic> json) {
  return Color(
    name: json['name'] as String,
    url: json['url'] as String,
  );
}

Map<String, dynamic> _$ColorToJson(Color instance) => <String, dynamic>{
      'name': instance.name,
      'url': instance.url,
    };

PokeApi _$PokeApiFromJson(Map<String, dynamic> json) {
  return PokeApi(
    height: json['height'] as int,
    weight: json['weight'] as int,
  );
}

Map<String, dynamic> _$PokeApiToJson(PokeApi instance) => <String, dynamic>{
      'height': instance.height,
      'weight': instance.weight,
    };
