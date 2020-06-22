import 'package:mobx/mobx.dart';

import '../../core/models/cards_model.dart';
import '../../core/services/deck_service.dart';

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final DeckService _service;

  _HomeControllerBase(this._service);

  @observable
  String deckId = '';

  @observable
  List<CardModel> deck;

  @observable
  List<CardsModel> tableCards = List<CardsModel>();

  @observable
  List<CardsModel> sentCards = List<CardsModel>();

  @observable
  List<CardModel> showedItems = List<CardModel>();

  final int numberShowed = 3;

  @action
  Future<bool> getDecks() async {
    var result = await _service.getDecks(1);
    setDeckId(result.deckId);
    await drawCards();
    return true;
  }

  @action
  setDeck(value) => deck = value;

  @action
  setDeckId(value) => deckId = value;

  @action
  Future<void> drawCards() async {
    tableCards.add(await _service.drawCards(deckId, 1));
    tableCards.add(await _service.drawCards(deckId, 2));
    tableCards.add(await _service.drawCards(deckId, 3));
    tableCards.add(await _service.drawCards(deckId, 4));
    tableCards.add(await _service.drawCards(deckId, 5));
    tableCards.add(await _service.drawCards(deckId, 6));
    tableCards.add(await _service.drawCards(deckId, 7));
    print('remaining: ${tableCards.last.remaining}');

    var newDeck = await _service.drawCards(deckId, tableCards.last.remaining);
    setDeck(newDeck.cards);
  }

  @action
  void turnLastCardOfDeck() {
    if (deck.isNotEmpty) {
      var item = deck.lastWhere((element) => element?.turned != true, orElse: () => null);
      item?.turned = true;
      setDeck(deck);
      flipItem(item);
    }
  }

  @action
  void flipItem(CardModel value) {
    showedItems.add(value);
    showedItems = showedItems;
    deck.removeLast();
  }

  @action
  void reloadDeck() {
    showedItems.forEach((element) => element.turned = false);
    setDeck(showedItems);
    showedItems = List<CardModel>();
  }
}
