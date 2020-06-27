import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../widgets/skill_item.dart';
import '../widgets/title.dart';

class SkillsWidget extends StatefulWidget {
  @override
  _SkillsWidgetState createState() => _SkillsWidgetState();
}

class _SkillsWidgetState extends State<SkillsWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TitleWidget(
          icon: FontAwesomeIcons.puzzlePiece,
          title: 'Habilidades',
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
      {'skill': 'Flutter', 'level': 4, 'total': 5},
      {'skill': 'Dart', 'level': 4, 'total': 5},
      {'skill': 'Javascript', 'level': 4, 'total': 5},
      {'skill': 'C#', 'level': 4, 'total': 5},
      {'skill': '.Net', 'level': 4, 'total': 5},
      {'skill': 'Web Api', 'level': 4, 'total': 5},
      {'skill': 'AngularJS', 'level': 4, 'total': 5},
      {'skill': 'Typescript', 'level': 4, 'total': 5},
      {'skill': 'CSS', 'level': 4, 'total': 5},
      {'skill': 'SQL Server', 'level': 3, 'total': 5},
      {'skill': 'ReactJS', 'level': 1, 'total': 5},
      {'skill': 'ReactNative', 'level': 2, 'total': 5},
    ];

    var listItems = List<Widget>();
    items.forEach((item) {
      listItems.add(SkillItem(
        title: item['skill'],
        level: item['level'],
        total: item['total'],
      ));
    });

    return listItems;
  }
}
