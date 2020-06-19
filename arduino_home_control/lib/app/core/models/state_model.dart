import 'package:json_annotation/json_annotation.dart';

part 'state_model.g.dart';

@JsonSerializable()
class StateModel {
  String temperature;
  String humidity;
  LedModel led;

  StateModel({this.temperature, this.humidity, this.led});

  factory StateModel.fromJson(Map<String, dynamic> json) => _$StateModelFromJson(json);

  Map<String, dynamic> toJson() => _$StateModelToJson(this);
}

@JsonSerializable()
class LedModel {
  String red;
  String blue;
  String green;

  LedModel({this.red, this.blue, this.green});

  factory LedModel.fromJson(Map<String, dynamic> json) => _$LedModelFromJson(json);

  Map<String, dynamic> toJson() => _$LedModelToJson(this);
}
