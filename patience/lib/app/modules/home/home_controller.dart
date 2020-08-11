import 'package:mobx/mobx.dart';

import '../../core/models/cards_model.dart';
import '../../core/services/deck_service.dart';
import 'home_store.dart';

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final HomeStore _store;
  final DeckService _service;

  _HomeControllerBase(this._store, this._service);

  // Begin Store

  @computed
  String get deckId => _store.deckId;
  @computed
  ObservableList<CardModel> get deck => _store.deck;
  @computed
  ObservableList<CardsModel> get tableCards => _store.tableCards;
  @computed
  ObservableList<CardModel> get showedItems => _store.showedItems;

  @action
  setDeck(value) => _store.setDeck(value);
  @action
  removeLastFromDeck() => _store.removeLastFromDeck();
  @action
  setDeckId(value) => _store.setDeckId(value);
  @action
  setTableCards(value) => _store.setTableCards(value);
  @action
  setShowedItems(value) => _store.setShowedItems(value);
  @action
  clearShowedItems() => _store.clearShowedItems();

  // End Store

  @action
  Future<bool> getDecks() async {
    var result = await _service.getDecks(1);
    setDeckId(result.deckId);
    await drawCards();
    return true;
  }

  @action
  Future<void> drawCards() async {
    setTableCards(await _service.drawCards(deckId, 1));
    setTableCards(await _service.drawCards(deckId, 2));
    setTableCards(await _service.drawCards(deckId, 3));
    setTableCards(await _service.drawCards(deckId, 4));
    setTableCards(await _service.drawCards(deckId, 5));
    setTableCards(await _service.drawCards(deckId, 6));
    setTableCards(await _service.drawCards(deckId, 7));

    var newDeck = await _service.drawCards(deckId, tableCards.last.remaining);
    deck.addAll(newDeck.cards);
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
    setShowedItems(value);
    removeLastFromDeck();
  }

  @action
  void reloadDeck() {
    showedItems.forEach((element) => element.turned = false);
    deck.addAll(showedItems.reversed.toList());
    clearShowedItems();
  }
}
