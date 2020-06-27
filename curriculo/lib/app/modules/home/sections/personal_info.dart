import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../widgets/info_item.dart';
import '../widgets/title.dart';

class PersonalInfoWidget extends StatefulWidget {
  @override
  _PersonalInfoWidgetState createState() => _PersonalInfoWidgetState();
}

class _PersonalInfoWidgetState extends State<PersonalInfoWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TitleWidget(
          icon: FontAwesomeIcons.solidUser,
          title: 'Info Pessoal',
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
      {'title': 'Endereço', 'content': 'Curitiba - Paraná - Brazil', 'isLink': false},
      {'title': 'E-mail', 'content': 'sthefannygonzaga@gmail.com', 'isLink': false},
      {'title': 'LinkedIn', 'content': 'linkedin.com/in/sthefannygonzaga/', 'isLink': true},
      {'title': 'Github', 'content': 'github.com/Sthefanny', 'isLink': true},
    ];

    var listItems = List<Widget>();
    items.forEach((item) {
      listItems.add(InfoItemWidget(
        title: item['title'],
        content: item['content'],
        isLink: item['isLink'],
      ));
    });

    return listItems;
  }
}
