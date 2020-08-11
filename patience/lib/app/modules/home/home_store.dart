import 'package:mobx/mobx.dart';

import '../../core/models/cards_model.dart';

part 'home_store.g.dart';

class HomeStore = _HomeStoreBase with _$HomeStore;

abstract class _HomeStoreBase with Store {
  @observable
  String deckId = '';
  @observable
  var deck = ObservableList<CardModel>();
  @observable
  var tableCards = ObservableList<CardsModel>();
  @observable
  var showedItems = ObservableList<CardModel>();

  @action
  setDeck(value) => deck = value;
  @action
  removeLastFromDeck() => deck.removeLast();
  @action
  setDeckId(value) => deckId = value;
  @action
  setTableCards(value) => tableCards.add(value);
  @action
  setShowedItems(value) => showedItems.add(value);
  @action
  clearShowedItems() => showedItems = ObservableList<CardModel>();
}
