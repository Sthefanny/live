import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'home_controller.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Arduino Home Control"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  @override
  void initState() {
    super.initState();
    controller.getState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          IconButton(
            icon: FaIcon(FontAwesomeIcons.recycle),
            onPressed: () => controller.getState(),
          )
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          buildTemperature(),
          buildHumidity(),
          buildButtons(),
        ],
      ),
    );
  }

  Widget buildTemperature() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(right: 10),
          child: FaIcon(
            FontAwesomeIcons.thermometerHalf,
            color: Color(0xFF059e8a),
            size: 40,
          ),
        ),
        Observer(builder: (_) {
          return Text(
            'Temperatura: ${controller.stateModel.temperature} \u00baC',
            style: TextStyle(fontSize: 18),
          );
        }),
      ],
    );
  }

  Widget buildHumidity() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(right: 10),
          child: FaIcon(
            FontAwesomeIcons.tint,
            color: Color(0xFF00add6),
            size: 40,
          ),
        ),
        Observer(builder: (_) {
          return Text(
            'Humidade: ${controller.stateModel.humidity} %',
            style: TextStyle(fontSize: 18),
          );
        }),
      ],
    );
  }

  Widget buildButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          height: 70,
          child: Observer(
            builder: (_) {
              return RaisedButton(
                shape: CircleBorder(),
                color: Colors.red,
                elevation: 10,
                child: FaIcon(
                  FontAwesomeIcons.solidLightbulb,
                  color: controller.stateModel.led.red == 'on' ? Colors.white : Colors.grey[400],
                  size: 40,
                ),
                onPressed: () {
                  controller.stateModel.led.red == 'on' ? controller.turnLight('red', 'off') : controller.turnLight('red', 'on');
                },
              );
            },
          ),
        ),
        Container(
          height: 70,
          child: Observer(
            builder: (_) {
              return RaisedButton(
                shape: CircleBorder(),
                color: Colors.green,
                elevation: 10,
                child: FaIcon(
                  FontAwesomeIcons.solidLightbulb,
                  color: controller.stateModel.led.green == 'on' ? Colors.white : Colors.grey[400],
                  size: 40,
                ),
                onPressed: () => controller.stateModel.led.green == 'on' ? controller.turnLight('green', 'off') : controller.turnLight('green', 'on'),
              );
            },
          ),
        ),
        Container(
          height: 70,
          child: Observer(
            builder: (_) {
              return RaisedButton(
                shape: CircleBorder(),
                color: Colors.blue,
                elevation: 10,
                child: FaIcon(
                  FontAwesomeIcons.solidLightbulb,
                  color: controller.stateModel.led.blue == 'on' ? Colors.white : Colors.grey[400],
                  size: 40,
                ),
                onPressed: () => controller.stateModel.led.blue == 'on' ? controller.turnLight('blue', 'off') : controller.turnLight('blue', 'on'),
              );
            },
          ),
        ),
      ],
    );
  }
}
