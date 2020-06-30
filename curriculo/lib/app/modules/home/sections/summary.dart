import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../home_controller.dart';
import '../widgets/title.dart';

class SummaryWidget extends StatefulWidget {
  @override
  _SummaryWidgetState createState() => _SummaryWidgetState();
}

class _SummaryWidgetState extends ModularState<SummaryWidget, HomeController> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Observer(builder: (_) {
            return TitleWidget(title: controller.cvModel?.summary?.sectionTitle ?? '', icon: FontAwesomeIcons.bullseye, hasMargin: false);
          }),
          buildContent(),
        ],
      ),
    );
  }

  Widget buildContent() {
    return Stack(
      children: [
        Expanded(child: buildText()),
        buildCircle(),
      ],
    );
  }

  Widget buildCircle() {
    return Transform.translate(
      offset: const Offset(11.0, 12.0),
      child: Container(
        width: 13,
        height: 13,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: const Color(0xFF282c34),
        ),
      ),
    );
  }

  Widget buildText() {
    return Container(
      margin: EdgeInsets.only(left: 16),
      padding: EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        border: Border(left: BorderSide(color: Color(0xFFd5d6d6), width: 3)),
      ),
      child: Padding(
        padding: EdgeInsets.only(left: 25, top: 10),
        child: Observer(builder: (_) {
          return Text(controller.cvModel?.summary?.description ?? '');
        }),
      ),
    );
  }
}
