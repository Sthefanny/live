import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'title.dart';

class PersonalInfoWidget extends StatefulWidget {
  @override
  _PersonalInfoWidgetState createState() => _PersonalInfoWidgetState();
}

class _PersonalInfoWidgetState extends State<PersonalInfoWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TitleWidget(
          icon: FontAwesomeIcons.solidUser,
          title: 'Info Pessoal',
        ),
      ],
    );
  }
}
