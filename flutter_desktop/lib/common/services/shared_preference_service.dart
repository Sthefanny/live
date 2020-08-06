import 'dart:convert';

import 'package:flutter/foundation.dart';

import '../models/consts_enum.dart';
import '../models/folder_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceService {
  SharedPreferences _prefs;

  SharedPreferenceService() {
    getPrefs();
  }

  Future<SharedPreferences> getPrefs() async {
    if (_prefs != null) return _prefs;
    return _prefs = await SharedPreferences.getInstance();
  }

  Future<bool> createFolder({@required String name}) async {
    var _folder = FolderModel(name: name);
    var _json = jsonEncode(_folder);
    _prefs = await getPrefs();
    var _folderId = await incrementFolderId();
    var _result = await _prefs.setString('${ConstsEnumDescription[ConstsEnum.FOLDER_NAME]}_$_folderId', _json);
    return _result;
  }

  Future<int> incrementFolderId() async {
    _prefs = await getPrefs();
    var _folderId = _prefs.getInt(ConstsEnumDescription[ConstsEnum.FOLDER_ID]) ?? 0;
    _folderId++;
    _prefs.setInt(ConstsEnumDescription[ConstsEnum.FOLDER_ID], _folderId);
    return _folderId;
  }

  Future<int> getFolderId() async {
    _prefs = await getPrefs();
    var _folderId = _prefs.getInt(ConstsEnumDescription[ConstsEnum.FOLDER_ID]);
    return _folderId;
  }

  Future<List<FolderModel>> getFolderList() async {
    _prefs = await getPrefs();
    var _folderList = List<FolderModel>();
    var _folderLength = await getFolderId();
    if (_folderLength != null) {
      for (var i = 1; i <= _folderLength; i++) {
        var _folderString = _prefs.getString('${ConstsEnumDescription[ConstsEnum.FOLDER_NAME]}_$i');
        if (_folderString != null) {
          var _folderJson = jsonDecode(_folderString);
          var _folder = FolderModel.fromJson(_folderJson);
          _folderList.add(_folder);
        }
      }
    }
    return _folderList;
  }
}
