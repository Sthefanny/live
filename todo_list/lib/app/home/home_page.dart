import 'package:flutter/material.dart';

import 'widgets/left_panel_widget.dart';
import 'widgets/note_widget.dart';
import 'widgets/preview_widget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var _size = MediaQuery.of(context).size;

    return Scaffold(
      body: Row(
        children: [
          Container(
            width: _size.width * .3,
            child: LeftPanelWidget(),
          ),
          Container(
            width: _size.width * .3,
            child: PreviewWidget(),
          ),
          Container(
            width: _size.width * .4,
            child: NoteWidget(),
          ),
        ],
      ),
    );
  }
}
