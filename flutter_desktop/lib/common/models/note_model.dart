import 'package:flutter/foundation.dart';

class NoteModel {
  String title;
  String description;
  DateTime date;

  NoteModel({@required this.title, this.description, @required this.date});

  NoteModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    description = json['description'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['title'] = this.title;
    data['description'] = this.description;
    data['date'] = this.date;
    return data;
  }
}
