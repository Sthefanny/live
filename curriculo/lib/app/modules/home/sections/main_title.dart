import 'package:curriculo/app/modules/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_modular/flutter_modular.dart';

class MainTitleWidget extends StatefulWidget {
  @override
  _MainTitleWidgetState createState() => _MainTitleWidgetState();
}

class _MainTitleWidgetState extends ModularState<MainTitleWidget, HomeController> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          buildIcon(),
          Padding(
            padding: const EdgeInsets.only(left: 5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildTitle(),
                buildSubTitle(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildIcon() {
    return FaIcon(
      FontAwesomeIcons.globeAmericas,
      size: 80,
    );
  }

  Widget buildTitle() {
    return Observer(builder: (_) {
      return Text(controller.cvModel?.mainTitle?.name ?? '', style: TextStyle(fontSize: 40, fontWeight: FontWeight.w500));
    });
  }

  Widget buildSubTitle() {
    return Observer(builder: (_) {
      return Text(controller.cvModel?.mainTitle?.title ?? '', style: TextStyle(fontSize: 36, fontWeight: FontWeight.w400));
    });
  }
}
