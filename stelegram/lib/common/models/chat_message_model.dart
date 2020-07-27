import 'package:flutter/foundation.dart';

class ChatMessageModel {
  final String name;
  final String message;
  final String createdTime;

  ChatMessageModel({@required this.name, @required this.message, @required this.createdTime});
}
