import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../home_controller.dart';
import '../models/cv_model.dart';
import '../widgets/skill_item.dart';
import '../widgets/title.dart';

class SkillsWidget extends StatefulWidget {
  @override
  _SkillsWidgetState createState() => _SkillsWidgetState();
}

class _SkillsWidgetState extends ModularState<SkillsWidget, HomeController> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Observer(builder: (_) {
          return TitleWidget(
            icon: FontAwesomeIcons.puzzlePiece,
            title: controller.cvModel?.skills?.sectionTitle ?? '',
          );
        }),
        buildListItems()
      ],
    );
  }

  Widget buildListItems() {
    return Observer(builder: (_) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: getListItems(controller.cvModel?.skills?.skillsData),
      );
    });
  }

  List<Widget> getListItems(List<SkillsData> skills) {
    var listItems = List<Widget>();
    skills?.forEach((item) {
      listItems.add(SkillItem(
        title: item.skill ?? '',
        level: item.level ?? '',
        total: item.total ?? '',
      ));
    });

    return listItems;
  }
}
