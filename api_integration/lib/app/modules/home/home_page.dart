import 'package:api_integration/app/shared/models/character_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'home_controller.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: FutureBuilder(
        future: controller.getCharacters(),
        builder: (context, AsyncSnapshot<Characters> snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }
          var characters = snapshot.data?.results;
          return ListView.builder(
            itemCount: characters.length,
            itemBuilder: (_, index) {
              var character = characters[index];
              return InkWell(
                child: Card(
                  child: ListTile(
                    title: Text(character.name),
                    subtitle: Text(character.gender),
                    leading: Image.network(character.image),
                    trailing: Text(character.species),
                  ),
                ),
                onTap: () => Modular.link.pushNamed('/details', arguments: {'id': character.id}),
              );
            },
          );
        },
      ),
    );
  }
}
