import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:live/app/common/models/credit_card_model.dart';
import 'package:live/app/common/repositories/credit_card_repository.dart';
import 'package:rxdart/subjects.dart';

class CreditCardBloc extends BlocBase {
  CreditCardRepository _repository;

  CreditCardBloc({@required CreditCardRepository repository}) : assert(repository != null) {
    _repository = repository;
  }

  final _showTransactionController = BehaviorSubject<Offset>.seeded(Offset(-10, 0));

  Stream<Offset> get showTransaction => _showTransactionController.stream;

  Function(Offset) get changeTransaction => _showTransactionController.sink.add;

  Stream<QuerySnapshot> get transactions => _repository.transactions;

  void addTransaction() {
    var transaction = CreditCardModel(
      storeType: 'Restaurante',
      store: 'Outback',
      amount: 732.20,
      instalments: 2,
      createdAt: Timestamp.now(),
      cardType: 'Cartão virtual',
    );

    _repository.add(transaction);
  }

  @override
  void dispose() {
    _showTransactionController.close();
    super.dispose();
  }
}
