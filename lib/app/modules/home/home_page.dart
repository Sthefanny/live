import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'home_module.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeBloc _bloc = HomeModule.to.getBloc();
  Size _size;

  var _blueColor = Color(0xFF12aebe);
  var _greenColor = Color(0xFF9cd130);
  var _yellowColor = Color(0xFFfea904);

  @override
  Widget build(BuildContext context) {
    _size = MediaQuery.of(context).size;

    return Container(
      color: Theme.of(context).primaryColor,
      child: Column(
        children: <Widget>[
          buildTop(),
          buildArrow(),
          buildCard(),
          buildDots(),
          buildButtonsPageView(),
        ],
      ),
    );
  }

  Widget buildTop() {
    return Padding(
      padding: const EdgeInsets.only(top: 100),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            'assets/images/logo.png',
            color: Colors.white,
            width: 40,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 5),
            child: Text('Keith', style: TextStyle(color: Colors.white, fontSize: 20, decoration: TextDecoration.none)),
          ),
        ],
      ),
    );
  }

  Widget buildArrow() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 50),
      child: Center(child: Icon(Icons.keyboard_arrow_down, color: Colors.white)),
    );
  }

  Widget buildCard() {
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
                      Icon(Icons.credit_card, color: Colors.black, size: 30),
                      buildDescription(),
                    ],
                  ),
                  buildVerticalLines(),
                ],
              ),
            ),
            buildLastPurchase(),
          ],
        ),
      ),
    );
  }

  Widget buildDescription() {
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

  Widget buildVerticalLines() {
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

  Widget buildDots() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(Icons.fiber_manual_record, size: 10, color: Colors.white),
          Icon(Icons.fiber_manual_record, size: 10, color: Theme.of(context).buttonColor),
          Icon(Icons.fiber_manual_record, size: 10, color: Theme.of(context).buttonColor),
        ],
      ),
    );
  }

  Widget buildButtonsPageView() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      width: _size.width,
      height: _size.height * 0.15,
      child: ListView(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          buildButton(icon: Icons.person_add, title: 'Indicar Amigos'),
          buildButton(icon: Icons.stay_current_portrait, title: 'Recarga de Celular'),
          buildButton(icon: Icons.attach_money, title: 'Cobrar'),
          buildButton(icon: Icons.euro_symbol, title: 'Empréstimos'),
          buildButton(icon: Icons.vertical_align_bottom, title: 'Depositar'),
          buildButton(icon: Icons.vertical_align_top, title: 'Transferir'),
        ],
      ),
    );
  }

  Widget buildButton({IconData icon, String title}) {
    return Container(
      width: _size.width * 0.3,
      child: Card(
        color: Theme.of(context).buttonColor,
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Icon(icon, color: Colors.white),
              Text(
                title,
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

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
