import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:live/app/common/models/credit_card_model.dart';
import 'package:live/app/modules/credit_card/credit_card_module.dart';

class CreditCardPage extends StatefulWidget {
  const CreditCardPage({Key key}) : super(key: key);

  @override
  _CreditCardPageState createState() => _CreditCardPageState();
}

class _CreditCardPageState extends State<CreditCardPage> {
  CreditCardBloc _bloc = CreditCardModule.to.getBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: <Widget>[
          Column(
            children: <Widget>[
              buildTop(),
              buildTransactions(),
            ],
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: _bloc.addTransaction,
      ),
    );
  }

  Widget buildTop() {
    return Container(
      height: 200,
      child: Row(
        children: <Widget>[
          Icon(Icons.credit_card, color: Colors.grey[700], size: 30),
          buildLastPurchases(),
          Icon(Icons.search, color: Colors.grey[600], size: 30),
        ],
      ),
    );
  }

  Widget buildLastPurchases() {
    return Text('teste');
  }

  Widget buildTransactions() {
    return StreamBuilder(
      stream: _bloc.transactions,
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (!snapshot.hasData) return Center(child: CircularProgressIndicator());

        var documents = snapshot.data.documents;

        return Container(
          height: 200,
          width: 200,
          child: ListView.builder(
            itemCount: documents.length,
            itemBuilder: (context, index) {
              var item = CreditCardModel.fromJson(documents[index]);
              return buildTransaction(item);
            },
          ),
        );
      },
    );
  }

  Widget buildTransaction(CreditCardModel item) {
    return Text(item.store);
  }
}
