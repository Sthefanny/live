import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';

import 'note_model.dart';

@HiveType(typeId: 0)
class FolderModel extends HiveObject {
  @HiveField(0)
  final String name;
  @HiveField(1)
  final List<NoteModel> notes;

  FolderModel({@required this.name, this.notes});
}
