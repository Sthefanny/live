import 'package:flutter/material.dart';

class Drawhorizontalline extends CustomPainter {
  Paint _paint;
  Color color;
  double width;
  double initialHeight;
  double finalHeight;
  StrokeCap strokeCap;

  Drawhorizontalline({this.color, this.width, this.initialHeight, this.finalHeight, this.strokeCap}) {
    _paint = Paint()
      ..color = color ?? Colors.black
      ..strokeWidth = width ?? 10
      ..strokeCap = strokeCap ?? StrokeCap.round;
  }

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawLine(Offset(0.0, initialHeight), Offset(0.0, finalHeight), _paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
