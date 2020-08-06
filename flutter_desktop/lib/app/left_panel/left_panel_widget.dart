import 'package:flutter/material.dart';
import 'package:flutter_desktop/app/home/home_controller.dart';
import 'package:flutter_desktop/common/models/folder_model.dart';

class LeftPanelWidget extends StatefulWidget {
  @override
  _LeftPanelWidgetState createState() => _LeftPanelWidgetState();
}

class _LeftPanelWidgetState extends State<LeftPanelWidget> {
  Size _size;
  final HomeController _controller = HomeController();
  Future<List<FolderModel>> _folderList;

  @override
  void initState() {
    super.initState();
    updateFolderList();
  }

  void updateFolderList() {
    setState(() {
      _folderList = _controller.getFolderList();
    });
  }

  @override
  Widget build(BuildContext context) {
    _size = MediaQuery.of(context).size;

    return Container(
      width: _size.width * .2,
      height: _size.height,
      decoration: BoxDecoration(
        border: Border(right: BorderSide(color: Colors.grey)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildTitle(),
          buildFolderList(),
          buildBottom(),
        ],
      ),
    );
  }

  Widget buildTitle() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Text(
        'Alpaca ToDo',
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
      ),
    );
  }

  Widget buildFolderList() {
    return Expanded(
      child: Container(
        child: FutureBuilder(
          future: _folderList,
          builder: (_, AsyncSnapshot<List<FolderModel>> snapshot) {
            if (!snapshot.hasData) return const SizedBox();

            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (_, i) {
                var _item = snapshot.data[i];
                return Text(_item.name ?? '');
              },
            );
          },
        ),
      ),
    );
  }

  Widget buildBottom() {
    return InkWell(
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 5),
            child: Icon(Icons.add_circle, size: 20),
          ),
          Expanded(
            child: Text('New Folder'),
          ),
        ],
      ),
      onTap: () async {
        await _controller.createFolder(name: 'teste');
        updateFolderList();
      },
    );
  }
}
