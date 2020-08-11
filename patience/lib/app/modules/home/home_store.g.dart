// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeStore on _HomeStoreBase, Store {
  final _$deckIdAtom = Atom(name: '_HomeStoreBase.deckId');

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

  final _$deckAtom = Atom(name: '_HomeStoreBase.deck');

  @override
  ObservableList<CardModel> get deck {
    _$deckAtom.reportRead();
    return super.deck;
  }

  @override
  set deck(ObservableList<CardModel> value) {
    _$deckAtom.reportWrite(value, super.deck, () {
      super.deck = value;
    });
  }

  final _$tableCardsAtom = Atom(name: '_HomeStoreBase.tableCards');

  @override
  ObservableList<CardsModel> get tableCards {
    _$tableCardsAtom.reportRead();
    return super.tableCards;
  }

  @override
  set tableCards(ObservableList<CardsModel> value) {
    _$tableCardsAtom.reportWrite(value, super.tableCards, () {
      super.tableCards = value;
    });
  }

  final _$showedItemsAtom = Atom(name: '_HomeStoreBase.showedItems');

  @override
  ObservableList<CardModel> get showedItems {
    _$showedItemsAtom.reportRead();
    return super.showedItems;
  }

  @override
  set showedItems(ObservableList<CardModel> value) {
    _$showedItemsAtom.reportWrite(value, super.showedItems, () {
      super.showedItems = value;
    });
  }

  final _$_HomeStoreBaseActionController =
      ActionController(name: '_HomeStoreBase');

  @override
  dynamic setDeck(dynamic value) {
    final _$actionInfo = _$_HomeStoreBaseActionController.startAction(
        name: '_HomeStoreBase.setDeck');
    try {
      return super.setDeck(value);
    } finally {
      _$_HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic removeLastFromDeck() {
    final _$actionInfo = _$_HomeStoreBaseActionController.startAction(
        name: '_HomeStoreBase.removeLastFromDeck');
    try {
      return super.removeLastFromDeck();
    } finally {
      _$_HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setDeckId(dynamic value) {
    final _$actionInfo = _$_HomeStoreBaseActionController.startAction(
        name: '_HomeStoreBase.setDeckId');
    try {
      return super.setDeckId(value);
    } finally {
      _$_HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setTableCards(dynamic value) {
    final _$actionInfo = _$_HomeStoreBaseActionController.startAction(
        name: '_HomeStoreBase.setTableCards');
    try {
      return super.setTableCards(value);
    } finally {
      _$_HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setShowedItems(dynamic value) {
    final _$actionInfo = _$_HomeStoreBaseActionController.startAction(
        name: '_HomeStoreBase.setShowedItems');
    try {
      return super.setShowedItems(value);
    } finally {
      _$_HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic clearShowedItems() {
    final _$actionInfo = _$_HomeStoreBaseActionController.startAction(
        name: '_HomeStoreBase.clearShowedItems');
    try {
      return super.clearShowedItems();
    } finally {
      _$_HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
deckId: ${deckId},
deck: ${deck},
tableCards: ${tableCards},
showedItems: ${showedItems}
    ''';
  }
}
