import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../common/utils/pokemon_utils.dart';
import 'details_controller.dart';

class DetailsPage extends StatefulWidget {
  final String num;
  final String title;
  const DetailsPage({Key key, this.title = "Details", this.num}) : super(key: key);

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends ModularState<DetailsPage, DetailsController> {
  @override
  void initState() {
    super.initState();
    controller.getPokemon(widget.num);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFdbd4fd),
        title: Text(
          widget.title,
          style: TextStyle(color: Color(0xFF6349a0)),
        ),
      ),
      body: Observer(
        builder: (_) {
          if (controller.pokemon == null) {
            return Center(child: CircularProgressIndicator());
          }
          return Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.network(
                    PokemonUtils.getPokemonImage(widget.num),
                    width: 100,
                    height: 100,
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
