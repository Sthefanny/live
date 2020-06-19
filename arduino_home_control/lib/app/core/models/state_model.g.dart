// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'state_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StateModel _$StateModelFromJson(Map<String, dynamic> json) {
  return StateModel(
    temperature: json['temperature'] as String,
    humidity: json['humidity'] as String,
    led: json['led'] == null
        ? null
        : LedModel.fromJson(json['led'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$StateModelToJson(StateModel instance) =>
    <String, dynamic>{
      'temperature': instance.temperature,
      'humidity': instance.humidity,
      'led': instance.led,
    };

LedModel _$LedModelFromJson(Map<String, dynamic> json) {
  return LedModel(
    red: json['red'] as String,
    blue: json['blue'] as String,
    green: json['green'] as String,
  );
}

Map<String, dynamic> _$LedModelToJson(LedModel instance) => <String, dynamic>{
      'red': instance.red,
      'blue': instance.blue,
      'green': instance.green,
    };
