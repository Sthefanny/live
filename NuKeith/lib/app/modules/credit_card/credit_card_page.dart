import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:live/app/common/models/credit_card_model.dart';
import 'package:live/app/common/models/store_type_enum.dart';
import 'package:live/app/common/utils/colors_config.dart';
import 'package:live/app/modules/credit_card/credit_card_module.dart';
import 'package:vector_math/vector_math_64.dart' as vec;

import '../../common/utils/draw_horizontal_line.dart';

class CreditCardPage extends StatefulWidget {
  const CreditCardPage({Key key}) : super(key: key);

  @override
  _CreditCardPageState createState() => _CreditCardPageState();
}

class _CreditCardPageState extends State<CreditCardPage> {
  CreditCardBloc _bloc = CreditCardModule.to.getBloc();
  Size _size;

  @override
  Widget build(BuildContext context) {
    _size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: <Widget>[
          GestureDetector(
            child: Container(
              width: _size.width - 7,
              height: _size.height,
              child: Row(
                children: <Widget>[
                  buildLeftMenu(),
                  buildValues(),
                  buildLines(),
                ],
              ),
            ),
            onHorizontalDragUpdate: (details) => changePosition(details),
          ),
          GestureDetector(
            child: StreamBuilder(
                stream: _bloc.showTransaction,
                builder: (context, AsyncSnapshot<Offset> snapshot) {
                  if (!snapshot.hasData && snapshot.data.dx == null)
                    return Container();
                  return SafeArea(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black,
                            blurRadius: 5.0, // soften the shadow
                            spreadRadius: 1.0, //extend the shadow
                            offset: Offset(
                              1.0, // Move to right 10  horizontally
                              2, // Move to bottom 10 Vertically
                            ),
                          )
                        ],
                      ),
                      transform: Matrix4.translation(
                          vec.Vector3(snapshot.data.dx, 0, 0)),
                      width: _size.width,
                      child: Column(
                        children: <Widget>[
                          buildTop(),
                          buildTransactions(),
                        ],
                      ),
                    ),
                  );
                }),
            onHorizontalDragUpdate: (details) => changePosition(details),
          ),
        ],
      ),
      // floatingActionButton: FloatingActionButton(
      //   child: Icon(Icons.add),
      //   onPressed: _bloc.addTransaction,
      // ),
    );
  }

  Widget buildLeftMenu() {
    return Container(
        height: _size.height,
      color: Color(0xFF492D46),
      child: Row(
        children: <Widget>[
          Text('teste'),
        ],
      ),
    );
  }

  Widget buildValues() {
    return Expanded(
      child: Container(
        height: _size.height,
        color: Color(0xFF422841),
        child: Row(
          children: <Widget>[
            Text('teste2'),
          ],
        ),
      ),
    );
  }

  void changePosition(DragUpdateDetails details) {
    double value = details.delta.direction != 0 ? -500 : -14;
    _bloc.changeTransaction(Offset(value, 0));
  }

  Widget buildLines() {
    return SafeArea(
      child: Column(
        children: <Widget>[
          CustomPaint(
              painter: Drawhorizontalline(
                  strokeCap: StrokeCap.square,
                  width: 15,
                  color: ColorsConfig.yellowColor,
                  initialHeight: 5,
                  finalHeight: _size.height * 0.3)),
          CustomPaint(
              painter: Drawhorizontalline(
                  strokeCap: StrokeCap.square,
                  width: 15,
                  color: ColorsConfig.greenColor,
                  initialHeight: _size.height * 0.3,
                  finalHeight: _size.height * 0.6)),
          CustomPaint(
              painter: Drawhorizontalline(
            strokeCap: StrokeCap.square,
            width: 15,
            color: ColorsConfig.blueColor,
            initialHeight: _size.height * 0.6,
            finalHeight: _size.height,
          )),
        ],
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
        if (!snapshot.hasData)
          return Center(child: CircularProgressIndicator());

        var documents = snapshot.data.documents;

        return Container(
          height: _size.height * 0.69,
          width: _size.width,
          child: ListView.builder(
            itemCount: documents.length,
            itemBuilder: (context, index) {
              var item = CreditCardModel.fromJson(documents[index]);
              return buildTransaction(item, index, documents.length);
            },
          ),
        );
      },
    );
  }

  Widget buildTransaction(CreditCardModel item, int index, int total) {
    var date = DateFormat('dd MMM').format(item.createdAt.toDate());
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: <Widget>[
          buildIconColumn(item, index, total),
          Expanded(child: buildTransactionText(item)),
          Text(date.toString()),
        ],
      ),
    );
  }

  Widget buildIconColumn(CreditCardModel item, int index, int total) {
    var icon = getStoreTypeIcon(MapStoreTypeEnum[item.storeType]);
    return Column(
      children: <Widget>[
        buildLine(index != 0),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: Icon(
            icon,
            color: Colors.grey[700],
          ),
        ),
        buildLine(index < total - 1),
      ],
    );
  }

  Widget buildLine(bool show) {
    return Container(
      height: 30,
      width: 1,
      decoration: BoxDecoration(
        color: show ? Colors.grey[700] : Colors.transparent,
      ),
    );
  }

  Widget buildTransactionText(CreditCardModel item) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(item.storeType,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          Text(item.store, style: Theme.of(context).textTheme.display1),
          Text('R\$ ${item.amount.toString().replaceAll(".", ",")}',
              style: Theme.of(context).textTheme.display1),
        ],
      ),
    );
  }
}
