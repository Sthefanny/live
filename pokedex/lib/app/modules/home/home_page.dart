import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../common/models/pokemons_model.dart';
import 'home_controller.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  Future<Pokemons> pokemonsFuture;

  @override
  void initState() {
    super.initState();
    pokemonsFuture = controller.getPokemon();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFdbd4fd),
      appBar: AppBar(
        backgroundColor: Color(0xFFdbd4fd),
        title: Text(
          widget.title,
          style: TextStyle(color: Color(0xFF6349a0)),
        ),
      ),
      body: FutureBuilder(
        future: pokemonsFuture,
        builder: (_, AsyncSnapshot<Pokemons> snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }

          var pokemons = snapshot.data;

          return buildPokemonList(pokemons);
        },
      ),
    );
  }

  Widget buildPokemonList(Pokemons pokemons) {
    return ListView.builder(
      itemCount: pokemons.pokemon.length,
      itemBuilder: (_, index) {
        var pokemon = pokemons.pokemon[index];
        return buildPokemonCard(pokemon);
      },
    );
  }

  Widget buildPokemonCard(Pokemon pokemon) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      child: Card(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              buildNames(pokemon),
              buildImage(pokemon.img),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildNames(Pokemon pokemon) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildNumber(pokemon.num),
        buildName(pokemon.name),
        buildTypes(pokemon.type),
      ],
    );
  }

  Widget buildNumber(String number) {
    return Text('#$number');
  }

  Widget buildName(String name) {
    return Text('$name');
  }

  Widget buildTypes(List<String> types) {
    return Row(
      children: getTypes(types),
    );
  }

  List<Widget> getTypes(List<String> types) {
    var typeList = List<Widget>();
    types.forEach((type) {
      typeList.add(Text(type));
    });

    return typeList;
  }

  Widget buildImage(String img) {
    return Stack(
      children: [
        buildPokeballImage(),
        Transform.translate(
          offset: const Offset(55.0, -20.0),
          child: Image.network(img, width: 100),
        ),
      ],
    );
  }

  Widget buildPokeballImage() {
    return Transform.translate(
      offset: const Offset(35.0, 0.0),
      child: Opacity(
        opacity: 0.05,
        child: Image.asset(
          'assets/images/Pokeball.png',
          width: 150,
        ),
      ),
    );
  }
}
