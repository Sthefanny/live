import 'package:flutter/material.dart';

class CenterPanelWidget extends StatefulWidget {
  @override
  _CenterPanelWidgetState createState() => _CenterPanelWidgetState();
}

class _CenterPanelWidgetState extends State<CenterPanelWidget> {
  Size _size;

  @override
  Widget build(BuildContext context) {
    _size = MediaQuery.of(context).size;

    return Container(
      width: _size.width * .3,
      height: _size.height,
      decoration: BoxDecoration(
        border: Border(right: BorderSide(color: Colors.grey)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [],
      ),
    );
  }

  Widget buildList() {
    return ListView(
      children: [
        buildItem(),
        buildItem(),
      ],
    );
  }

  Widget buildItem({String title, String description, String dateTime}) {}
}
