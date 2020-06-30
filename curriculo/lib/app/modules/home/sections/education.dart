import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../home_controller.dart';
import '../widgets/title.dart';

class EducationWidget extends StatefulWidget {
  @override
  _EducationWidgetState createState() => _EducationWidgetState();
}

class _EducationWidgetState extends ModularState<EducationWidget, HomeController> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Observer(builder: (_) {
            return Observer(builder: (_) {
              return TitleWidget(title: controller.cvModel?.education?.sectionTitle ?? '', icon: FontAwesomeIcons.graduationCap, hasMargin: false);
            });
          }),
          buildContent(),
        ],
      ),
    );
  }

  Widget buildContent() {
    return Stack(
      children: [
        Observer(builder: (_) {
          return Expanded(child: buildText());
        }),
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
    var item = controller.cvModel?.education?.educationData != null ? controller.cvModel?.education?.educationData[0] : null;

    return Container(
      margin: EdgeInsets.only(left: 16),
      padding: EdgeInsets.only(bottom: 20, left: 25, top: 10),
      decoration: BoxDecoration(
        border: Border(left: BorderSide(color: Color(0xFFd5d6d6), width: 3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(item?.institution ?? '', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
          Text('${item?.city} - ${item?.country} - Graduada em ${item?.finalDate}', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Text(item?.course ?? '', style: TextStyle(fontSize: 14)),
          ),
        ],
      ),
    );
  }
}
