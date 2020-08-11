import 'package:flutter/material.dart';
import 'package:patience/app/core/models/cards_model.dart';

class FrontCardWidget extends StatefulWidget {
  final CardModel model;

  const FrontCardWidget({Key key, @required this.model}) : super(key: key);

  @override
  _FrontCardWidgetState createState() => _FrontCardWidgetState();
}

class _FrontCardWidgetState extends State<FrontCardWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(widget.model.image),
        ),
      ),
      width: 45,
      height: 65,
    );
  }
}
