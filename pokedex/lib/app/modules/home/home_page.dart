import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pokedex/app/common/configs/color_config.dart';

import '../../common/models/pokemons_model.dart';
import '../../common/utils/pokemon_utils.dart';
import '../../common/widgets/pokemon_description_widget.dart';
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
      backgroundColor: ColorConfig.bgColor,
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
              backgroundColor: ColorConfig.bgColor,
              title: Text(
                widget.title,
                style: TextStyle(color: ColorConfig.mainColor),
              ),
              actions: <Widget>[
                InkWell(
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: FaIcon(FontAwesomeIcons.qrcode, color: ColorConfig.mainColor),
                  ),
                  onTap: () => Modular.link.pushNamed('qr_code'),
                ),
              ],
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
    var cardColor = PokemonUtils.getTypeColor(pokemon.type.first);
    return InkWell(
      child: Container(
        height: 120,
        margin: EdgeInsets.only(bottom: 5, top: 10, left: 20, right: 20),
        child: Stack(
          children: <Widget>[
            Card(
              color: cardColor.withOpacity(.8),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    PokemonDescriptionWidget(num: pokemon.num, name: pokemon.name, types: pokemon.type),
                  ],
                ),
              ),
            ),
            buildPokeballImage(),
            buildImage(pokemon.num),
          ],
        ),
      ),
      onTap: () => Modular.link.pushNamed('/details', arguments: {'pokemon': pokemon}),
    );
  }

  Widget buildImage(String num) {
    var _pokemonSize = 100.0;
    var _marginRight = 50.0;
    var _position = _size.width - _pokemonSize - _marginRight;
    return Transform.translate(
      offset: Offset(_position, -10.0),
      child: Hero(
        tag: num,
        child: Image.network(
          PokemonUtils.getPokemonImage(num),
          width: _pokemonSize,
          height: _pokemonSize,
        ),
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
}
