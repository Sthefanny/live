import 'package:hive/hive.dart';
import 'package:todo_list/common/models/folder_model.dart';

class FolderRepository {
  Box box;

  FolderRepository() {
    initBox();
  }

  void initBox() async {
    box = await Hive.openBox('folder');
  }

  void addFolder({String name}) {
    var folder = FolderModel(name: name);
    box.add(folder);
  }

  dynamic getFirtResult() {
    return box.getAt(0);
  }
}
