import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../widgets/title.dart';

class SummaryWidget extends StatefulWidget {
  @override
  _SummaryWidgetState createState() => _SummaryWidgetState();
}

class _SummaryWidgetState extends State<SummaryWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          TitleWidget(title: 'Resumo', icon: FontAwesomeIcons.bullseye, hasMargin: false),
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
    var text =
        'Sou uma desenvolvedora full stack com conhecimento em algumas linguagens de front-end e back-end, frameworks responsivos e melhores práticas de códigos. Atualmente, meu foco principal é o desenvolvimento com Flutter, já estou trabalhando com essa tecnologia há 7 meses, com 2 aplicativos publicados pela empresa em que estou trabalhando.';

    return Container(
      margin: EdgeInsets.only(left: 16),
      padding: EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        border: Border(left: BorderSide(color: Color(0xFFd5d6d6), width: 3)),
      ),
      child: Padding(
        padding: EdgeInsets.only(left: 25, top: 10),
        child: Text(text),
      ),
    );
  }
}
