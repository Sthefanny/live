import 'package:json_annotation/json_annotation.dart';

part 'character_model.g.dart';

@JsonSerializable()
class Characters {
  Info info;
  List<Results> results;

  Characters({this.info, this.results});

  factory Characters.fromJson(Map<String, dynamic> json) => _$CharactersFromJson(json);
  Map<String, dynamic> toJson() => _$CharactersToJson(this);
}

@JsonSerializable()
class Info {
  int count;
  int pages;
  String next;
  String prev;

  Info({this.count, this.pages, this.next, this.prev});

  factory Info.fromJson(Map<String, dynamic> json) => _$InfoFromJson(json);
  Map<String, dynamic> toJson() => _$InfoToJson(this);
}

@JsonSerializable()
class Results {
  int id;
  String name;
  String status;
  String species;
  String type;
  String gender;
  Origin origin;
  Origin location;
  String image;
  List<String> episode;
  String url;
  String created;

  Results({this.id, this.name, this.status, this.species, this.type, this.gender, this.origin, this.location, this.image, this.episode, this.url, this.created});

  factory Results.fromJson(Map<String, dynamic> json) => _$ResultsFromJson(json);
  Map<String, dynamic> toJson() => _$ResultsToJson(this);
}

@JsonSerializable()
class Origin {
  String name;
  String url;

  Origin({this.name, this.url});

  factory Origin.fromJson(Map<String, dynamic> json) => _$OriginFromJson(json);
  Map<String, dynamic> toJson() => _$OriginToJson(this);
}
