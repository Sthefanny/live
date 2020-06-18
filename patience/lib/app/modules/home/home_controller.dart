import 'package:mobx/mobx.dart';

import '../../core/models/cards_model.dart';
import '../../core/models/decks_model.dart';
import '../../core/services/deck_service.dart';

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final DeckService _service;

  _HomeControllerBase(this._service);

  Future<DecksModel> getDecks() async {
    return await _service.getDecks(1);
  }

  Future<CardsModel> drawCards(String deckId) async {
    return await _service.drawCards(deckId, 10);
  }
}
