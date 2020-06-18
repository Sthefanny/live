// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'decks_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DecksModel _$DecksModelFromJson(Map<String, dynamic> json) {
  return DecksModel(
    success: json['success'] as bool,
    deckId: json['deck_id'] as String,
    shuffled: json['shuffled'] as bool,
    remaining: json['remaining'] as int,
  );
}

Map<String, dynamic> _$DecksModelToJson(DecksModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'deck_id': instance.deckId,
      'shuffled': instance.shuffled,
      'remaining': instance.remaining,
    };
