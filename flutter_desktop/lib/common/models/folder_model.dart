import 'package:flutter/foundation.dart';

import 'note_model.dart';

class FolderModel {
  String name;
  List<NoteModel> notes;

  FolderModel({@required this.name, this.notes});

  FolderModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    if (json['notes'] != null) {
      notes = List<NoteModel>();
      json['notes'].forEach((v) {
        notes.add(NoteModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    if (this.notes != null) {
      data['notes'] = this.notes.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
