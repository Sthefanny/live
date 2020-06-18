import 'package:json_annotation/json_annotation.dart';

part 'cards_model.g.dart';

@JsonSerializable()
class CardsModel {
  bool success;
  List<CardModel> cards;
  String deckId;
  int remaining;

  CardsModel({this.success, this.cards, this.deckId, this.remaining});

  factory CardsModel.fromJson(Map<String, dynamic> json) => _$CardsModelFromJson(json);
  Map<String, dynamic> toJson() => _$CardsModelToJson(this);
}

@JsonSerializable()
class CardModel {
  String image;
  String value;
  String suit;
  String code;

  CardModel({this.image, this.value, this.suit, this.code});

  factory CardModel.fromJson(Map<String, dynamic> json) => _$CardModelFromJson(json);
  Map<String, dynamic> toJson() => _$CardModelToJson(this);
}
