import 'package:flutter/material.dart';

import '../../../common/utils/pokemon_utils.dart';
import '../../../common/widgets/pokemon_description_widget.dart';

class DetailsTopWidget extends StatelessWidget {
  final String num;
  final String name;
  final List<String> types;

  const DetailsTopWidget({Key key, @required this.num, @required this.name, @required this.types}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 40),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Hero(tag: num, child: buildImage()),
          PokemonDescriptionWidget(num: num, name: name, types: types),
        ],
      ),
    );
  }

  Widget buildImage() {
    return Container(
      margin: EdgeInsets.only(right: 30),
      child: Image.network(
        PokemonUtils.getPokemonImage(num),
        width: 100,
        height: 100,
      ),
    );
  }
}
