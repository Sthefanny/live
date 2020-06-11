import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'home_module.dart';
import 'widgets/carousel.dart';
import 'widgets/creditcard_container.dart';
import 'widgets/nuconta_container.dart';
import 'widgets/rewards_container.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeBloc _bloc = HomeModule.to.getBloc();
  Size _size;

  @override
  Widget build(BuildContext context) {
    _size = MediaQuery.of(context).size;

    return Container(
      color: Theme.of(context).primaryColor,
      child: Column(
        children: <Widget>[
          buildTop(),
          buildArrow(),
          CarouselWithIndicator(cardList: <Widget>[
            CreditCardContainer(),
            NuContaContainer(),
            RewardsContainer(),
          ]),
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
