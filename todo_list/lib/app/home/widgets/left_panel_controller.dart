import 'package:flutter/foundation.dart';
import 'package:todo_list/common/repositories/folder_repository.dart';

class LeftPanelController {
  final FolderRepository _folderRepository;

  LeftPanelController(this._folderRepository);

  void addFolder({@required String name}) {
    _folderRepository.addFolder(name: name);
  }

  dynamic getFirtResult() {
    return _folderRepository.getFirtResult();
  }
}
