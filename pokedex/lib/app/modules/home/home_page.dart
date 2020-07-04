import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../common/models/pokemons_model.dart';
import '../../common/utils/pokemon_utils.dart';
import 'home_controller.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Pokédex da Stel"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  Size _size;

  @override
  void initState() {
    super.initState();
    controller.getPokemon();
  }

  @override
  Widget build(BuildContext context) {
    _size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Color(0xFFdbd4fd),
      body: Observer(
        builder: (_) {
          if (controller.pokemonList == null || controller.pokemonList?.pokemon == null) {
            return Center(child: CircularProgressIndicator());
          }

          var pokemons = controller.pokemonList;

          return CustomScrollView(slivers: <Widget>[
            SliverAppBar(
              pinned: true,
              expandedHeight: 200,
              flexibleSpace: FlexibleSpaceBar(
                background: Image.asset('assets/images/pokemons.jpg'),
              ),
              backgroundColor: Color(0xFFdbd4fd),
              title: Text(
                widget.title,
                style: TextStyle(color: Color(0xFF6349a0)),
              ),
            ),
            buildPokemonList(pokemons),
          ]);
        },
      ),
    );
  }

  Widget buildPokemonList(Pokemons pokemons) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (_, int index) {
          var pokemon = pokemons.pokemon[index];
          return buildPokemonCard(pokemon);
        },
        childCount: pokemons.pokemon.length,
      ),
    );
  }

  Widget buildPokemonCard(Pokemon pokemon) {
    var cardColor = getTypeColor(pokemon.type.first);
    return Container(
      height: 120,
      margin: EdgeInsets.only(bottom: 5, top: 10, left: 20, right: 20),
      child: Stack(
        children: <Widget>[
          InkWell(
            child: Card(
              color: cardColor.withOpacity(.8),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    buildNames(pokemon),
                  ],
                ),
              ),
            ),
            onTap: () => Modular.link.pushNamed('/details/${pokemon.num}'),
          ),
          buildPokeballImage(),
          buildImage(pokemon.num),
        ],
      ),
    );
  }

  Widget buildNames(Pokemon pokemon) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        buildNumber(pokemon.num),
        buildName(pokemon.name),
        buildTypes(pokemon.type),
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
        var typeColor = getTypeColor(type);
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

  Widget buildImage(String num) {
    var _pokemonSize = 100.0;
    var _marginRight = 50.0;
    var _position = _size.width - _pokemonSize - _marginRight;
    return Transform.translate(
      offset: Offset(_position, -10.0),
      child: Image.network(
        PokemonUtils.getPokemonImage(num),
        width: _pokemonSize,
        height: _pokemonSize,
      ),
    );
  }

  Widget buildPokeballImage() {
    var _pokeballSize = 200.0;
    var _marginRight = -5.0;
    var _position = _size.width - _pokeballSize - _marginRight;
    return Transform.translate(
      offset: Offset(_position, 0.0),
      child: Opacity(
        opacity: 0.1,
        child: Image.asset(
          'assets/images/Pokeball.png',
          width: _pokeballSize,
          height: _pokeballSize,
        ),
      ),
    );
  }

  Color getTypeColor(String type) {
    switch (type) {
      case 'Normal':
        return Color(0xFFbabb96);
      case 'Fire':
        return Color(0xFFf19c65);
      case 'Fighting':
        return Color(0xFFca6260);
      case 'Water':
        return Color(0xFF8ca5f2);
      case 'Flying':
        return Color(0xFFb9a5f2);
      case 'Grass':
        return Color(0xFFA7DB8D);
      case 'Poison':
        return Color(0xFFb26bb4);
      case 'Electric':
        return Color(0xFFf8db65);
      case 'Ground':
        return Color(0xFFe6cd8c);
      case 'Psychic':
        return Color(0xFFf67ba3);
      case 'Rock':
        return Color(0xFFc6b56b);
      case 'Ice':
        return Color(0xFFafe1e0);
      case 'Bug':
        return Color(0xFFbac95b);
      case 'Ghost':
        return Color(0xFF917eae);
      case 'Dark':
        return Color(0xFF918074);
      case 'Steel':
        return Color(0xFFc7c6d9);
      case 'Fairy':
        return Color(0xFFf0adbe);
      default:
        return Color(0xFF7f8992);
    }
  }
}
