import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../home_controller.dart';
import '../models/cv_model.dart';
import '../widgets/skill_item.dart';
import '../widgets/title.dart';

class LanguagesWidget extends StatefulWidget {
  @override
  _LanguagesWidgetState createState() => _LanguagesWidgetState();
}

class _LanguagesWidgetState extends ModularState<LanguagesWidget, HomeController> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Observer(builder: (_) {
          return TitleWidget(
            icon: FontAwesomeIcons.solidFlag,
            title: controller.cvModel?.languages?.sectionTitle ?? '',
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
        children: getListItems(controller.cvModel.languages.languagesData),
      );
    });
  }

  List<Widget> getListItems(List<LanguagesData> items) {
    var listItems = List<Widget>();
    items?.forEach((item) {
      listItems.add(SkillItem(
        title: item.language ?? '',
        level: item.level ?? '',
        total: item.total ?? '',
      ));
    });

    return listItems;
  }
}
