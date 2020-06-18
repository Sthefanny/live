import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../core/models/decks_model.dart';
import 'home_controller.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: FutureBuilder(
        future: controller.getDecks(),
        builder: (_, AsyncSnapshot<DecksModel> snapshot) {
          if (!snapshot.hasData) return CircularProgressIndicator();

          return Center(
            child: buildCard(snapshot.data),
          );
        },
      ),
    );
  }

  Widget buildCard(DecksModel model) {
    return InkWell(
      child: Card(
        child: ListTile(
          title: Text(model.deckId),
        ),
      ),
      onTap: () async {
        var result = await controller.drawCards(model.deckId);
        print(result.cards[0].value);
        print(result.cards[0].suit);
      },
    );
  }
}
