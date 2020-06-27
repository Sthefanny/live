import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../widgets/title.dart';

class ExperiencesWidget extends StatefulWidget {
  @override
  _ExperiencesWidgetState createState() => _ExperiencesWidgetState();
}

class _ExperiencesWidgetState extends State<ExperiencesWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          TitleWidget(
            title: 'Últimas experiências',
            icon: FontAwesomeIcons.briefcase,
            hasMargin: false,
          ),
          buildContent(),
        ],
      ),
    );
  }

  Widget buildContent() {
    return Stack(
      children: [
        buildListItems(),
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

  Widget buildListItems() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: getListItems(),
    );
  }

  List<Widget> getListItems() {
    var items = [
      {
        'title': 'Desenvolvedora Flutter',
        'company': 'Blend IT - Cliente: CEABS Serviços',
        'description':
            'Migrei um aplicativo mobile (Auto CEABS) de linguagens nativas para Flutter e subi essa nova versão para as lojas (avaliação anterior: 1.1, avaliação atual: 3.7). Criei outro aplicativo e agora estou mudando o layout do primeiro.',
        'initialDate': 'Jul/19',
        'finalDate': 'Presente'
      },
      {
        'title': 'Desenvolvedora Full Stack',
        'company': 'Blend IT - Cliente: CEABS Serviços',
        'description': 'Adicionei ReactJS numa aplicação e fiz manutenção em alguns códigos antigos. Agora estou desenvolvendo uma aplicação mobile híbrida com Flutter.',
        'initialDate': 'Fev/19',
        'finalDate': 'Jul/19'
      },
      {
        'title': 'Desenvolvedora Full Stack',
        'company': 'CINQ Technologies - Cliente: Sita (Irlanda)',
        'description': 'Desenvolvimento de um sistema de gerenciamento de aeroportos utilizando: .NET, C#, Web Api, Git, CI/CD, AngularJS (versão 1.3 and 1.5), Javascript, HTML5, CSS.',
        'initialDate': 'Mar-17',
        'finalDate': 'Fev/19'
      },
      {
        'title': 'Desenvolvedora Full Stack',
        'company': 'CINQ Technologies - Cliente: Fibra',
        'description':
            'Um projeto de quatro meses para construir a nova arquitetura de um aplicativo existente. O aplicativo em si foi construído usando: Conceitos de SOA, Entity Server, Web API, .Net Entity Framework, AngularJS, jQuery, Bootstrap, Git',
        'initialDate': 'Nov-16',
        'finalDate': 'Mar-17'
      },
    ];

    var listItems = List<Widget>();
    items.forEach((item) {
      listItems.add(buildText(item));
    });

    return listItems;
  }

  Widget buildText(dynamic item) {
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
            Text(item['title'], style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
            Text(item['company'], style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Text(item['description'], style: TextStyle(fontSize: 14)),
            ),
          ],
        ),
      ),
    );
  }
}
