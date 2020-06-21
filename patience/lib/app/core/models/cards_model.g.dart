// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cards_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CardsModel _$CardsModelFromJson(Map<String, dynamic> json) {
  return CardsModel(
    success: json['success'] as bool,
    cards: (json['cards'] as List)
        ?.map((e) =>
            e == null ? null : CardModel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    deckId: json['deck_id'] as String,
    remaining: json['remaining'] as int,
  );
}

Map<String, dynamic> _$CardsModelToJson(CardsModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'cards': instance.cards?.map((e) => e?.toJson())?.toList(),
      'deck_id': instance.deckId,
      'remaining': instance.remaining,
    };

CardModel _$CardModelFromJson(Map<String, dynamic> json) {
  return CardModel(
    image: json['image'] as String,
    value: json['value'] as String,
    suit: json['suit'] as String,
    code: json['code'] as String,
    turned: json['turned'] as bool,
  );
}

Map<String, dynamic> _$CardModelToJson(CardModel instance) => <String, dynamic>{
      'image': instance.image,
      'value': instance.value,
      'suit': instance.suit,
      'code': instance.code,
      'turned': instance.turned,
    };
