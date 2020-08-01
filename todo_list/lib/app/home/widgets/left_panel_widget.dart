import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'left_panel_controller.dart';
import '../../../common/repositories/folder_repository.dart';

class LeftPanelWidget extends StatefulWidget {
  @override
  _LeftPanelWidgetState createState() => _LeftPanelWidgetState();
}

class _LeftPanelWidgetState extends State<LeftPanelWidget> {
  final _formKey = GlobalKey<FormState>();
  LeftPanelController _controller;
  String _folderName;

  @override
  void initState() {
    super.initState();

    openBox();
  }

  Future<void> openBox() async {
    await Hive.initFlutter();
    await Hive.openBox('folder');
    _controller = LeftPanelController(FolderRepository());
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border(right: BorderSide(color: Colors.grey[400])),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildTitle(),
          buildList(),
          buildBottom(),
        ],
      ),
    );
  }

  Widget buildTitle() {
    return Text('Alpaca Notes');
  }

  Widget buildList() {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        child: ValueListenableBuilder(
          valueListenable: Hive.box('folder').listenable(),
          builder: (context, box, widget) {
            return Text('teste');
          },
        ),
      ),
    );
  }

  Widget buildBottom() {
    return InkWell(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildButton(),
          buildNewFolderText(),
        ],
      ),
      onTap: showAlert,
    );
  }

  Widget buildButton() {
    return Container(
      margin: const EdgeInsets.only(right: 5),
      child: Icon(Icons.add_circle, size: 20),
    );
  }

  Widget buildNewFolderText() {
    return Text('New Folder');
  }

  Future<void> showAlert() {
    return showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Folder Name'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Form(
                  key: _formKey,
                  child: TextFormField(
                    onSaved: (String value) {
                      setState(() {
                        _folderName = value;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Create Folder'),
              onPressed: () {
                _formKey.currentState.save();
                _controller.addFolder(name: _folderName);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
