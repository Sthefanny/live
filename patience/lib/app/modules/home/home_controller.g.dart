// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on _HomeControllerBase, Store {
  final _$deckIdAtom = Atom(name: '_HomeControllerBase.deckId');

  @override
  String get deckId {
    _$deckIdAtom.reportRead();
    return super.deckId;
  }

  @override
  set deckId(String value) {
    _$deckIdAtom.reportWrite(value, super.deckId, () {
      super.deckId = value;
    });
  }

  final _$deckAtom = Atom(name: '_HomeControllerBase.deck');

  @override
  CardsModel get deck {
    _$deckAtom.reportRead();
    return super.deck;
  }

  @override
  set deck(CardsModel value) {
    _$deckAtom.reportWrite(value, super.deck, () {
      super.deck = value;
    });
  }

  final _$tableCardsAtom = Atom(name: '_HomeControllerBase.tableCards');

  @override
  List<CardsModel> get tableCards {
    _$tableCardsAtom.reportRead();
    return super.tableCards;
  }

  @override
  set tableCards(List<CardsModel> value) {
    _$tableCardsAtom.reportWrite(value, super.tableCards, () {
      super.tableCards = value;
    });
  }

  final _$sentCardsAtom = Atom(name: '_HomeControllerBase.sentCards');

  @override
  List<CardsModel> get sentCards {
    _$sentCardsAtom.reportRead();
    return super.sentCards;
  }

  @override
  set sentCards(List<CardsModel> value) {
    _$sentCardsAtom.reportWrite(value, super.sentCards, () {
      super.sentCards = value;
    });
  }

  final _$showedItemsAtom = Atom(name: '_HomeControllerBase.showedItems');

  @override
  List<CardModel> get showedItems {
    _$showedItemsAtom.reportRead();
    return super.showedItems;
  }

  @override
  set showedItems(List<CardModel> value) {
    _$showedItemsAtom.reportWrite(value, super.showedItems, () {
      super.showedItems = value;
    });
  }

  final _$getDecksAsyncAction = AsyncAction('_HomeControllerBase.getDecks');

  @override
  Future<bool> getDecks() {
    return _$getDecksAsyncAction.run(() => super.getDecks());
  }

  final _$drawCardsAsyncAction = AsyncAction('_HomeControllerBase.drawCards');

  @override
  Future<void> drawCards() {
    return _$drawCardsAsyncAction.run(() => super.drawCards());
  }

  final _$_HomeControllerBaseActionController =
      ActionController(name: '_HomeControllerBase');

  @override
  dynamic setDeck(dynamic value) {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.setDeck');
    try {
      return super.setDeck(value);
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setDeckId(dynamic value) {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.setDeckId');
    try {
      return super.setDeckId(value);
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void turnLastCardOfDeck() {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.turnLastCardOfDeck');
    try {
      return super.turnLastCardOfDeck();
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void flipItem(CardModel value) {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.flipItem');
    try {
      return super.flipItem(value);
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
deckId: ${deckId},
deck: ${deck},
tableCards: ${tableCards},
sentCards: ${sentCards},
showedItems: ${showedItems}
    ''';
  }
}
