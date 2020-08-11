import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../home_controller.dart';

class ReloadDeckWidget extends StatefulWidget {
  @override
  _ReloadDeckWidgetState createState() => _ReloadDeckWidgetState();
}

class _ReloadDeckWidgetState extends ModularState<ReloadDeckWidget, HomeController> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 45,
      height: 65,
      child: InkWell(
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.white, width: 2),
            borderRadius: BorderRadius.circular(5),
            color: Colors.purple,
          ),
          child: Center(
            child: Center(
              child: Icon(Icons.refresh, color: Colors.white, size: 35),
            ),
          ),
        ),
        onTap: controller.reloadDeck,
      ),
    );
  }
}
