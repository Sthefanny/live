import 'package:flutter/foundation.dart';
import 'package:flutter_desktop/common/models/folder_model.dart';
import 'package:flutter_desktop/common/services/shared_preference_service.dart';

class HomeController {
  SharedPreferenceService _service;

  HomeController() {
    _service = SharedPreferenceService();
  }

  Future<List<FolderModel>> getFolderList() {
    return _service.getFolderList();
  }

  Future<bool> createFolder({@required String name}) {
    return _service.createFolder(name: name);
  }
}
