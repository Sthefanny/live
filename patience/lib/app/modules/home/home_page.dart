import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'home_controller.dart';
import 'widgets/deck_widget.dart';
import 'widgets/showed_cards_widget.dart';
import 'widgets/table_cards_widget.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  Future<bool> response;
  Size _size;

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
    response = controller.getDecks();
  }

  @override
  Widget build(BuildContext context) {
    _size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Color(0xFF34A249),
      body: FutureBuilder(
        future: response,
        builder: (_, AsyncSnapshot<bool> snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(backgroundColor: Colors.purple),
            );
          }

          return SafeArea(
            child: Container(
              height: _size.height,
              padding: EdgeInsets.all(10),
              child: Row(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      DeckWidget(),
                      ShowedCardsWidget(),
                    ],
                  ),
                  Expanded(child: TableCardsWidget()),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
