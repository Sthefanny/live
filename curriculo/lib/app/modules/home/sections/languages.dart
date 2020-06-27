import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../widgets/skill_item.dart';
import '../widgets/title.dart';

class LanguagesWidget extends StatefulWidget {
  @override
  _LanguagesWidgetState createState() => _LanguagesWidgetState();
}

class _LanguagesWidgetState extends State<LanguagesWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TitleWidget(
          icon: FontAwesomeIcons.solidFlag,
          title: 'Idiomas',
        ),
        buildListItems()
      ],
    );
  }

  Widget buildListItems() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: getListItems(),
    );
  }

  List<Widget> getListItems() {
    var items = [
      {'language': 'Português', 'level': 5, 'total': 5},
      {'language': 'Inglês', 'level': 4, 'total': 5},
    ];

    var listItems = List<Widget>();
    items.forEach((item) {
      listItems.add(SkillItem(
        title: item['language'],
        level: item['level'],
        total: item['total'],
      ));
    });

    return listItems;
  }
}
