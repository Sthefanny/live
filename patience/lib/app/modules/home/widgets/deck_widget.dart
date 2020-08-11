import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../home_controller.dart';
import 'back_card_widget.dart';
import 'reload_deck_widget.dart';

class DeckWidget extends StatefulWidget {
  @override
  _DeckWidgetState createState() => _DeckWidgetState();
}

class _DeckWidgetState extends ModularState<DeckWidget, HomeController> {
  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 1,
      child: InkWell(
        child: Observer(
          builder: (_) {
            var cardsResult = List<Widget>();
            if (controller.deck.length == 0) {
              return ReloadDeckWidget();
            }
            return Container(
              width: 45,
              height: 100,
              child: ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: controller.deck.length,
                itemBuilder: (_, i) {
                  var total = controller.deck.length - 1;
                  var card = controller.deck[i];
                  var top = i.toDouble();

                  cardsResult.add(
                    Visibility(
                      visible: card?.turned == true ? false : true,
                      child: Positioned(
                        top: top,
                        child: BackCardWidget(),
                      ),
                    ),
                  );

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
              ),
            );
          },
        ),
        onTap: controller.turnLastCardOfDeck,
      ),
    );
  }
}
