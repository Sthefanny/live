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
          if (!snapshot.hasData) return Center(child: CircularProgressIndicator(backgroundColor: Colors.purple));

          return SafeArea(
            child: Container(
              height: _size.height,
              padding: EdgeInsets.all(10),
              child: Row(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      buildDeck(),
                      buildShowedCards(),
                    ],
                  ),
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

          var cardsResult = List<Widget>();

          return Container(
            width: 50,
            height: 300,
            margin: EdgeInsets.symmetric(horizontal: 5),
            child: ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              itemCount: cards.cards.length,
              itemBuilder: (_, i) {
                var total = cards.cards.length - 1;
                var card = cards.cards[i];

                if (total == i) {
                  cardsResult.add(Positioned(top: (i * 10).toDouble(), child: buildFrontCard(card)));
                  return Container(
                    height: _size.height,
                    child: Stack(
                      children: cardsResult,
                    ),
                  );
                } else {
                  cardsResult.add(Positioned(top: (i * 10).toDouble(), child: buildBackCard()));
                }
                return const SizedBox();
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

  Widget buildDeck() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        InkWell(
          child: Container(
            width: 50,
            height: 100,
            margin: EdgeInsets.symmetric(horizontal: 5),
            child: Observer(
              builder: (_) {
                var cardsResult = List<Widget>();
                return ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: controller.deck.cards.length,
                  itemBuilder: (_, i) {
                    var total = controller.deck.cards.length - 1;
                    var top = i.toDouble();

                    cardsResult.add(Positioned(top: top, child: buildBackCard()));

                    if (total == i) {
                      return Container(
                        height: 300,
                        child: Stack(
                          children: cardsResult,
                        ),
                      );
                    }

                    return const SizedBox();
                  },
                );
              },
            ),
          ),
          onTap: controller.turnLastCardOfDeck,
        ),
      ],
    );
  }

  Widget buildShowedCards() {
    var cardsResult = List<Widget>();
    return Container(
      width: 50,
      height: 100,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white, width: 2),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Observer(
        builder: (_) {
          return ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            itemCount: controller.showedItems.length,
            itemBuilder: (_, i) {
              var total = controller.showedItems.length - 1;
              var card = controller.showedItems[i];
              var top = (i * 15).toDouble();

              if (cardsResult.length <= 3) {
                cardsResult.add(Positioned(top: top, child: buildFrontCard(card)));
              }

              if (total == i) {
                return Container(
                  height: 300,
                  child: Stack(
                    children: cardsResult,
                  ),
                );
              }

              return const SizedBox();
            },
          );
        },
      ),
    );
  }
}
