// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemons_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Pokemons _$PokemonsFromJson(Map<String, dynamic> json) {
  return Pokemons(
    pokemon: (json['pokemon'] as List)
        ?.map((e) =>
            e == null ? null : Pokemon.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$PokemonsToJson(Pokemons instance) => <String, dynamic>{
      'pokemon': instance.pokemon,
    };

Pokemon _$PokemonFromJson(Map<String, dynamic> json) {
  return Pokemon(
    id: json['id'] as int,
    num: json['num'] as String,
    name: json['name'] as String,
    img: json['img'] as String,
    type: (json['type'] as List)?.map((e) => e as String)?.toList(),
    height: json['height'] as String,
    weight: json['weight'] as String,
    candy: json['candy'] as String,
    candyCount: json['candy_count'] as int,
    egg: json['egg'] as String,
    spawnChance: (json['spawn_chance'] as num)?.toDouble(),
    avgSpawns: (json['avg_spawns'] as num)?.toDouble(),
    spawnTime: json['spawn_time'] as String,
    multipliers: (json['multipliers'] as List)
        ?.map((e) => (e as num)?.toDouble())
        ?.toList(),
    weaknesses: (json['weaknesses'] as List)?.map((e) => e as String)?.toList(),
    nextEvolution: (json['next_evolution'] as List)
        ?.map((e) =>
            e == null ? null : Evolution.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    prevEvolution: (json['prev_evolution'] as List)
        ?.map((e) =>
            e == null ? null : Evolution.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$PokemonToJson(Pokemon instance) => <String, dynamic>{
      'id': instance.id,
      'num': instance.num,
      'name': instance.name,
      'img': instance.img,
      'type': instance.type,
      'height': instance.height,
      'weight': instance.weight,
      'candy': instance.candy,
      'candy_count': instance.candyCount,
      'egg': instance.egg,
      'spawn_chance': instance.spawnChance,
      'avg_spawns': instance.avgSpawns,
      'spawn_time': instance.spawnTime,
      'multipliers': instance.multipliers,
      'weaknesses': instance.weaknesses,
      'next_evolution': instance.nextEvolution,
      'prev_evolution': instance.prevEvolution,
    };

Evolution _$EvolutionFromJson(Map<String, dynamic> json) {
  return Evolution(
    num: json['num'] as String,
    name: json['name'] as String,
  );
}

Map<String, dynamic> _$EvolutionToJson(Evolution instance) => <String, dynamic>{
      'num': instance.num,
      'name': instance.name,
    };
