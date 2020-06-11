import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:live/app/common/utils/draw_horizontal_line.dart';

class RewardsContainer extends StatelessWidget {
  final Color _blueColor = Color(0xFF12aebe);
  final Color _greenColor = Color(0xFF9cd130);
  final Color _yellowColor = Color(0xFFfea904);

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;

    return Container(
      width: _size.width,
      height: _size.height * 0.5,
      padding: EdgeInsets.all(10),
      child: Card(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: Icon(FontAwesomeIcons.gift, color: Colors.grey[700], size: 30),
                          ),
                          Text('Rewards', style: TextStyle(color: Colors.grey[600])),
                        ],
                      ),
                      buildDescription(_size),
                    ],
                  ),
                  buildVerticalLines(_size),
                ],
              ),
            ),
            buildLastPurchase(),
          ],
        ),
      ),
    );
  }

  Widget buildDescription(Size _size) {
    return Container(
      height: _size.height * 0.25,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('Fatura Atual'.toUpperCase(), style: GoogleFonts.openSans(textStyle: TextStyle(color: _blueColor, fontSize: 16))),
          Text('R\$ 10.000,00', style: GoogleFonts.openSans(textStyle: TextStyle(color: _blueColor, fontSize: 40))),
          Row(
            children: <Widget>[
              Text('Limite disponível', style: GoogleFonts.openSans(textStyle: TextStyle(color: Colors.black, fontSize: 16))),
              Padding(
                padding: const EdgeInsets.only(left: 5),
                child: Text('R\$ 30.000,00', style: GoogleFonts.openSans(textStyle: TextStyle(color: _greenColor, fontSize: 16, fontWeight: FontWeight.bold))),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildVerticalLines(Size _size) {
    return Column(
      children: <Widget>[
        CustomPaint(painter: Drawhorizontalline(color: _yellowColor, initialHeight: 0, finalHeight: _size.height * 0.02)),
        CustomPaint(painter: Drawhorizontalline(color: _greenColor, initialHeight: _size.height * 0.1, finalHeight: _size.height * 0.3)),
        CustomPaint(painter: Drawhorizontalline(color: _blueColor, initialHeight: _size.height * 0.02, finalHeight: _size.height * 0.1, strokeCap: StrokeCap.square)),
      ],
    );
  }

  Widget buildLastPurchase() {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 30),
        color: Color(0xFFf7f6f9),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Icon(Icons.pets, color: Colors.black, size: 30),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Text('Compra mais recente em Pet Shop do Trico no valor de R\$ 959,99 hoje'),
            )),
            Icon(Icons.keyboard_arrow_right, color: Colors.black, size: 30),
          ],
        ),
      ),
    );
  }
}
