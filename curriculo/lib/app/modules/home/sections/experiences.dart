import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../home_controller.dart';
import '../models/cv_model.dart';
import '../widgets/title.dart';

class ExperiencesWidget extends StatefulWidget {
  @override
  _ExperiencesWidgetState createState() => _ExperiencesWidgetState();
}

class _ExperiencesWidgetState extends ModularState<ExperiencesWidget, HomeController> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Observer(builder: (_) {
            return TitleWidget(
              title: controller.cvModel?.experiences?.sectionTitle ?? '',
              icon: FontAwesomeIcons.briefcase,
              hasMargin: false,
            );
          }),
          buildListItems(),
        ],
      ),
    );
  }

  Widget buildContent(ExperiencesData item) {
    return Stack(
      children: [
        buildDates(item),
        buildText(item),
        buildCircle(),
      ],
    );
  }

  Widget buildDates(ExperiencesData item) {
    return Transform.translate(
      offset: const Offset(-40.0, 12.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(item.initialDate ?? '', style: TextStyle(fontSize: 12), textAlign: TextAlign.start),
          Text(item.finalDate ?? '', style: TextStyle(fontSize: 12), textAlign: TextAlign.start),
        ],
      ),
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

  Widget buildListItems() {
    return Observer(builder: (_) {
      if (controller?.cvModel?.experiences?.experiencesData != null) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: getListItems(controller.cvModel.experiences.experiencesData),
        );
      }
      return const SizedBox();
    });
  }

  List<Widget> getListItems(List<ExperiencesData> items) {
    var listItems = List<Widget>();
    items?.forEach((item) {
      listItems.add(buildContent(item));
    });

    return listItems;
  }

  Widget buildText(ExperiencesData item) {
    return Container(
      margin: EdgeInsets.only(left: 16),
      padding: EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        border: Border(left: BorderSide(color: Color(0xFFd5d6d6), width: 3)),
      ),
      child: Padding(
        padding: EdgeInsets.only(left: 25, top: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(item.title ?? '', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
            Text(item.company ?? '', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Text(item.description ?? '', style: TextStyle(fontSize: 14)),
            ),
          ],
        ),
      ),
    );
  }
}
