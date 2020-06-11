import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'details_controller.dart';

class DetailsPage extends StatefulWidget {
  final int id;
  final String title;
  const DetailsPage({Key key, this.title = "Details", @required this.id}) : super(key: key);

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends ModularState<DetailsPage, DetailsController> {
  @override
  void initState() {
    super.initState();
    controller.getDetails(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Observer(builder: (_) {
          return Text(controller.details?.name ?? '');
        }),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            buildImage(),
            buildTextInfo(),
          ],
        ),
      ),
    );
  }

  Widget buildImage() {
    return Observer(
      builder: (_) {
        if (controller.details.image == null) return Container();
        return Image.network(controller.details.image);
      },
    );
  }

  Widget buildTextInfo() {
    return Observer(
      builder: (_) {
        if (controller.details == null) return Container();
        return Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text(controller.details.gender),
            Text(controller.details.location.name),
            Text(controller.details.species),
            Text(controller.details.status),
            Text(controller.details.type),
          ],
        );
      },
    );
  }
}
