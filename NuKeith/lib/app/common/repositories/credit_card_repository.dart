import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:live/app/common/models/credit_card_model.dart';

class CreditCardRepository {
  CollectionReference _db;

  CreditCardRepository() {
    _db = Firestore.instance.collection('creditCard');
  }

  Stream<QuerySnapshot> get transactions => _db.snapshots();

  void add(CreditCardModel model) => _db.document().setData(model.toJson());
}
