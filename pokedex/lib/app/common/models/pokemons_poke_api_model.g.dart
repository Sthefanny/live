// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemons_poke_api_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PokemonsPokeApi _$PokemonsPokeApiFromJson(Map<String, dynamic> json) {
  return PokemonsPokeApi(
    abilities: (json['abilities'] as List)
        ?.map((e) =>
            e == null ? null : Abilities.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    baseExperience: json['base_experience'] as int,
    gameIndices: (json['game_indices'] as List)
        ?.map((e) =>
            e == null ? null : GameIndices.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    height: json['height'] as int,
    id: json['id'] as int,
    isDefault: json['is_default'] as bool,
    locationAreaEncounters: json['location_area_encounters'] as String,
    moves: (json['moves'] as List)
        ?.map(
            (e) => e == null ? null : Moves.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    name: json['name'] as String,
    order: json['order'] as int,
    species: json['species'] == null
        ? null
        : Ability.fromJson(json['species'] as Map<String, dynamic>),
    stats: (json['stats'] as List)
        ?.map(
            (e) => e == null ? null : Stats.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    types: (json['types'] as List)
        ?.map(
            (e) => e == null ? null : Types.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    weight: json['weight'] as int,
  );
}

Map<String, dynamic> _$PokemonsPokeApiToJson(PokemonsPokeApi instance) =>
    <String, dynamic>{
      'abilities': instance.abilities,
      'base_experience': instance.baseExperience,
      'game_indices': instance.gameIndices,
      'height': instance.height,
      'id': instance.id,
      'is_default': instance.isDefault,
      'location_area_encounters': instance.locationAreaEncounters,
      'moves': instance.moves,
      'name': instance.name,
      'order': instance.order,
      'species': instance.species,
      'stats': instance.stats,
      'types': instance.types,
      'weight': instance.weight,
    };

Abilities _$AbilitiesFromJson(Map<String, dynamic> json) {
  return Abilities(
    ability: json['ability'] == null
        ? null
        : Ability.fromJson(json['ability'] as Map<String, dynamic>),
    isHidden: json['is_hidden'] as bool,
    slot: json['slot'] as int,
  );
}

Map<String, dynamic> _$AbilitiesToJson(Abilities instance) => <String, dynamic>{
      'ability': instance.ability,
      'is_hidden': instance.isHidden,
      'slot': instance.slot,
    };

Ability _$AbilityFromJson(Map<String, dynamic> json) {
  return Ability(
    name: json['name'] as String,
    url: json['url'] as String,
  );
}

Map<String, dynamic> _$AbilityToJson(Ability instance) => <String, dynamic>{
      'name': instance.name,
      'url': instance.url,
    };

GameIndices _$GameIndicesFromJson(Map<String, dynamic> json) {
  return GameIndices(
    gameIndex: json['game_index'] as int,
    version: json['version'] == null
        ? null
        : Ability.fromJson(json['version'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$GameIndicesToJson(GameIndices instance) =>
    <String, dynamic>{
      'game_index': instance.gameIndex,
      'version': instance.version,
    };

Moves _$MovesFromJson(Map<String, dynamic> json) {
  return Moves(
    move: json['move'] == null
        ? null
        : Ability.fromJson(json['move'] as Map<String, dynamic>),
    versionGroupDetails: (json['version_group_details'] as List)
        ?.map((e) => e == null
            ? null
            : VersionGroupDetails.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$MovesToJson(Moves instance) => <String, dynamic>{
      'move': instance.move,
      'version_group_details': instance.versionGroupDetails,
    };

VersionGroupDetails _$VersionGroupDetailsFromJson(Map<String, dynamic> json) {
  return VersionGroupDetails(
    levelLearnedAt: json['level_learned_at'] as int,
    moveLearnMethod: json['move_learn_method'] == null
        ? null
        : Ability.fromJson(json['move_learn_method'] as Map<String, dynamic>),
    versionGroup: json['version_group'] == null
        ? null
        : Ability.fromJson(json['version_group'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$VersionGroupDetailsToJson(
        VersionGroupDetails instance) =>
    <String, dynamic>{
      'level_learned_at': instance.levelLearnedAt,
      'move_learn_method': instance.moveLearnMethod,
      'version_group': instance.versionGroup,
    };

Stats _$StatsFromJson(Map<String, dynamic> json) {
  return Stats(
    baseStat: json['base_stat'] as int,
    effort: json['effort'] as int,
    stat: json['stat'] == null
        ? null
        : Ability.fromJson(json['stat'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$StatsToJson(Stats instance) => <String, dynamic>{
      'base_stat': instance.baseStat,
      'effort': instance.effort,
      'stat': instance.stat,
    };

Types _$TypesFromJson(Map<String, dynamic> json) {
  return Types(
    slot: json['slot'] as int,
    type: json['type'] == null
        ? null
        : Ability.fromJson(json['type'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$TypesToJson(Types instance) => <String, dynamic>{
      'slot': instance.slot,
      'type': instance.type,
    };
