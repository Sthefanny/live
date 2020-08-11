import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../home_controller.dart';
import 'back_card_widget.dart';
import 'front_card_widget.dart';

class TableCardsWidget extends StatefulWidget {
  @override
  _TableCardsWidgetState createState() => _TableCardsWidgetState();
}

class _TableCardsWidgetState extends ModularState<TableCardsWidget, HomeController> {
  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
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
                    cardsResult.add(Positioned(top: (i * 10).toDouble(), child: FrontCardWidget(model: card)));
                    return Container(
                      height: MediaQuery.of(context).size.height,
                      child: Stack(
                        children: cardsResult,
                      ),
                    );
                  } else {
                    cardsResult.add(Positioned(top: (i * 10).toDouble(), child: BackCardWidget()));
                  }
                  return const SizedBox();
                },
              ),
            );
          },
        );
      },
    );
  }
}
