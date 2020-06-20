import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../core/models/cards_model.dart';
import 'home_controller.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  Future<bool> response;

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
    return Scaffold(
      backgroundColor: Color(0xFF34A249),
      body: FutureBuilder(
        future: response,
        builder: (_, AsyncSnapshot<bool> snapshot) {
          if (!snapshot.hasData) return CircularProgressIndicator();

          return SafeArea(
            child: Container(
              child: Row(
                children: <Widget>[
                  buildBackCard(),
                  Expanded(child: buildTableCard()),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget buildTableCard() {
    return Observer(builder: (_) {
      return ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: NeverScrollableScrollPhysics(),
        itemCount: controller.tableCards.length,
        itemBuilder: (_, index) {
          var cards = controller.tableCards[index];
          return Container(
            width: 40,
            height: 30,
            margin: EdgeInsets.symmetric(horizontal: 5),
            child: ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              itemCount: cards.cards.length,
              itemBuilder: (_, i) {
                var card = cards.cards[i];
                return buildFrontCard(card);
              },
            ),
          );
        },
      );
    });
  }

  Widget buildBackCard() {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white, width: 2),
        borderRadius: BorderRadius.circular(5),
        color: Colors.purple,
      ),
      width: 45,
      height: 65,
      child: Center(
          child: Container(
        width: 25,
        height: 25,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
        ),
        child: Center(
          child: Text(
            'S',
            style: TextStyle(color: Colors.purple, fontSize: 22, fontWeight: FontWeight.bold),
          ),
        ),
      )),
    );
  }

  Widget buildFrontCard(CardModel model) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(model.image),
        ),
      ),
      width: 45,
      height: 65,
    );
  }
}
