import 'package:flutter/material.dart';

class LeftPanelWidget extends StatefulWidget {
  @override
  _LeftPanelWidgetState createState() => _LeftPanelWidgetState();
}

class _LeftPanelWidgetState extends State<LeftPanelWidget> {
  Size _size;

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
        child: Text('List'),
      ),
    );
  }

  Widget buildBottom() {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 5),
          child: Icon(Icons.add_circle, size: 20),
        ),
        Expanded(
          child: Text('New Folder'),
        ),
      ],
    );
  }
}
