import 'package:cloud_firestore/cloud_firestore.dart';

class CreditCardModel {
  final String id;
  final double amount;
  final String cardType;
  final Timestamp createdAt;
  final int instalments;
  final String store;
  final String storeType;

  CreditCardModel({this.id, this.amount, this.cardType, this.createdAt, this.instalments, this.store, this.storeType});

  CreditCardModel.fromJson(DocumentSnapshot json)
      : id = json.documentID,
        amount = json['amount'],
        cardType = json['cardType'],
        createdAt = json['createdAt'],
        instalments = json['instalments'],
        store = json['store'],
        storeType = json['storeType'];

  Map<String, dynamic> toJson() => {
        'amount': amount,
        'cardType': cardType,
        'createdAt': createdAt,
        'instalments': instalments,
        'store': store,
        'storeType': storeType,
      };
}
