import 'package:flutter/material.dart';

class BackCardWidget extends StatefulWidget {
  @override
  _BackCardWidgetState createState() => _BackCardWidgetState();
}

class _BackCardWidgetState extends State<BackCardWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white, width: 2),
        borderRadius: BorderRadius.circular(5),
        color: Colors.purple,
      ),
      width: 45,
      height: 65,
      child: Center(
          child: Container(
        width: 25,
        height: 25,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
        ),
        child: Center(
          child: Text(
            'S',
            style: TextStyle(color: Colors.purple, fontSize: 22, fontWeight: FontWeight.bold),
          ),
        ),
      )),
    );
  }
}
