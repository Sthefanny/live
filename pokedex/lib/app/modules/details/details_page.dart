import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../common/models/pokemons_model.dart';
import '../../common/utils/pokemon_utils.dart';
import 'details_controller.dart';
import 'widgets/details_top.dart';

class DetailsPage extends StatefulWidget {
  final Pokemon pokemon;
  final String title;
  const DetailsPage({Key key, this.title = "Details", this.pokemon}) : super(key: key);

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends ModularState<DetailsPage, DetailsController> {
  Size _size;
  Color _typeColor;

  @override
  void initState() {
    super.initState();
    controller.getPokemonDetails(widget.pokemon.id);
  }

  @override
  Widget build(BuildContext context) {
    _size = MediaQuery.of(context).size;

    _typeColor = PokemonUtils.getTypeColor(widget.pokemon.type.first);
    return Scaffold(
      backgroundColor: _typeColor.withOpacity(.8),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            DetailsTopWidget(num: widget.pokemon.num, name: widget.pokemon.name, types: widget.pokemon.type),
            buildCard(),
          ],
        ),
      ),
    );
  }

  Widget buildCard() {
    return Container(
      width: _size.width,
      height: _size.height * 0.6,
      padding: EdgeInsets.all(30),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30)),
      ),
      child: buildContent(),
    );
  }

  Widget buildContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        buildDescription(),
        Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Text('Pokédex Data', style: TextStyle(color: _typeColor, fontWeight: FontWeight.bold, fontSize: 20)),
        ),
        buildInfo(title: 'Weight: ', description: widget.pokemon.weight),
        buildInfo(title: 'Height: ', description: widget.pokemon.height),
        buildWeakness(),
      ],
    );
  }

  Widget buildDescription() {
    return Observer(
      builder: (_) {
        if (controller.pokemonDetail == null || controller.pokemonDetail.flavorTextEntries == null) return const SizedBox();
        var textEntry = controller.pokemonDetail.flavorTextEntries.firstWhere((element) => element.language.name == 'en');
        var description = textEntry.flavorText.replaceAll('\n', '');
        return Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: Text(description ?? ''),
        );
      },
    );
  }

  Widget buildInfo({String title, String description}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: <Widget>[
          Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
          Text(description),
        ],
      ),
    );
  }

  Widget buildWeakness() {
    return Row(
      children: <Widget>[
        Text('Weaknesses: ', style: TextStyle(fontWeight: FontWeight.bold)),
        Row(
          children: getAllWeakness(),
        ),
      ],
    );
  }

  Widget buildIcon(String type) {
    return Container(
      width: 30,
      height: 30,
      margin: EdgeInsets.symmetric(horizontal: 2),
      child: CircleAvatar(
        backgroundColor: PokemonUtils.getTypeColor(type),
        child: SvgPicture.asset('assets/images/${type.toLowerCase()}.svg', width: 20, height: 20, color: Colors.white),
      ),
    );
  }

  List<Widget> getAllWeakness() {
    var weaknessList = List<Widget>();
    widget.pokemon.weaknesses.forEach((weakness) {
      weaknessList.add(buildIcon(weakness));
    });
    return weaknessList;
  }
}
