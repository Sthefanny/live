import 'package:flutter/material.dart';

import '../utils/pokemon_utils.dart';

class PokemonDescriptionWidget extends StatelessWidget {
  final String num;
  final String name;
  final List<String> types;

  const PokemonDescriptionWidget({Key key, @required this.num, @required this.name, @required this.types}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        buildNumber(num),
        buildName(name),
        buildTypes(types),
      ],
    );
  }

  Widget buildNumber(String number) {
    return Container(
      margin: EdgeInsets.only(bottom: 5, top: 5),
      child: Text(
        '#$number',
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.bold,
          color: Color(0xFF484053),
        ),
      ),
    );
  }

  Widget buildName(String name) {
    return Text(
      '$name',
      style: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 22,
        shadows: [
          Shadow(
            color: Colors.grey,
            blurRadius: 1,
            offset: Offset(0.0, 1.0),
          ),
        ],
      ),
    );
  }

  Widget buildTypes(List<String> types) {
    return Row(
      children: getTypes(types),
    );
  }

  List<Widget> getTypes(List<String> types) {
    var typeList = List<Widget>();
    types.forEach(
      (type) {
        var typeColor = PokemonUtils.getTypeColor(type);
        typeList.add(
          Padding(
            padding: const EdgeInsets.only(right: 5),
            child: Chip(
              padding: EdgeInsets.all(0),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
              backgroundColor: typeColor,
              elevation: 2,
              label: Text(type, style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500)),
            ),
          ),
        );
      },
    );

    return typeList;
  }
}
