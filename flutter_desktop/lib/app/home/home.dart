import 'package:flutter/material.dart';

import '../center_panel/center_panel_widget.dart';
import '../left_panel/left_panel_widget.dart';
import '../list_body/list_body_widget.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        margin: const EdgeInsets.all(10),
        child: Row(
          children: [
            LeftPanelWidget(),
            CenterPanelWidget(),
            Expanded(child: ListBodyWidget()),
          ],
        ),
      ),
    );
  }
}
