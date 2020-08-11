import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../home_controller.dart';
import 'front_card_widget.dart';

class ShowedCardsWidget extends StatefulWidget {
  @override
  _ShowedCardsWidgetState createState() => _ShowedCardsWidgetState();
}

class _ShowedCardsWidgetState extends ModularState<ShowedCardsWidget, HomeController> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 100,
      child: Observer(
        builder: (_) {
          var cardsResult = List<Widget>();
          return ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            itemCount: controller.showedItems.length,
            itemBuilder: (_, i) {
              var total = controller.showedItems.length - 1;
              var card = controller.showedItems[i];
              var top = i.toDouble();

              cardsResult.add(
                Positioned(
                  top: top,
                  child: FrontCardWidget(model: card),
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
          );
        },
      ),
    );
  }
}
