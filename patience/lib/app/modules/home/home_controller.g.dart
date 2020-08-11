// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on _HomeControllerBase, Store {
  Computed<String> _$deckIdComputed;

  @override
  String get deckId =>
      (_$deckIdComputed ??= Computed<String>(() => super.deckId,
              name: '_HomeControllerBase.deckId'))
          .value;
  Computed<ObservableList<CardModel>> _$deckComputed;

  @override
  ObservableList<CardModel> get deck =>
      (_$deckComputed ??= Computed<ObservableList<CardModel>>(() => super.deck,
              name: '_HomeControllerBase.deck'))
          .value;
  Computed<ObservableList<CardsModel>> _$tableCardsComputed;

  @override
  ObservableList<CardsModel> get tableCards => (_$tableCardsComputed ??=
          Computed<ObservableList<CardsModel>>(() => super.tableCards,
              name: '_HomeControllerBase.tableCards'))
      .value;
  Computed<ObservableList<CardModel>> _$showedItemsComputed;

  @override
  ObservableList<CardModel> get showedItems => (_$showedItemsComputed ??=
          Computed<ObservableList<CardModel>>(() => super.showedItems,
              name: '_HomeControllerBase.showedItems'))
      .value;

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
  dynamic removeLastFromDeck() {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.removeLastFromDeck');
    try {
      return super.removeLastFromDeck();
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
  dynamic setTableCards(dynamic value) {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.setTableCards');
    try {
      return super.setTableCards(value);
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setShowedItems(dynamic value) {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.setShowedItems');
    try {
      return super.setShowedItems(value);
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic clearShowedItems() {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.clearShowedItems');
    try {
      return super.clearShowedItems();
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
  void reloadDeck() {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.reloadDeck');
    try {
      return super.reloadDeck();
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
showedItems: ${showedItems}
    ''';
  }
}
