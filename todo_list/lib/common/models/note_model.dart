import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';

class NoteModel extends HiveObject {
  @HiveField(0)
  final String title;
  @HiveField(1)
  final String description;
  @HiveField(2)
  final DateTime dateTime;

  NoteModel({@required this.title, @required this.description, @required this.dateTime});
}
