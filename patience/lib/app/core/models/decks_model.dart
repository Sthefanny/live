import 'package:json_annotation/json_annotation.dart';

part 'decks_model.g.dart';

@JsonSerializable()
class DecksModel {
  bool success;
  String deckId;
  bool shuffled;
  int remaining;

  DecksModel({this.success, this.deckId, this.shuffled, this.remaining});

  factory DecksModel.fromJson(Map<String, dynamic> json) => _$DecksModelFromJson(json);
  Map<String, dynamic> toJson() => _$DecksModelToJson(this);
}
