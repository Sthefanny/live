import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'home_controller.dart';
import 'sections/education.dart';
import 'sections/experiences.dart';
import 'sections/languages.dart';
import 'sections/main_title.dart';
import 'sections/personal_info.dart';
import 'sections/skills.dart';
import 'sections/summary.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  Size _size;

  @override
  void initState() {
    super.initState();
    controller.getCvModel();
  }

  @override
  Widget build(BuildContext context) {
    _size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Color(0xFF282c34),
      body: SafeArea(
        child: Stack(
          children: [
            buildButtons(),
            buildContent(),
          ],
        ),
      ),
    );
  }

  Widget buildButtons() {
    return Container(
      margin: EdgeInsets.all(10),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: RaisedButton(
              child: Text('PT-BR'),
              onPressed: () {
                controller.changeLanguage('pt_BR');
              },
            ),
          ),
          RaisedButton(
            child: Text('EN'),
            onPressed: () {
              controller.changeLanguage('en_US');
            },
          ),
        ],
      ),
    );
  }

  Widget buildContent() {
    var _pageSize = _size.width * .5;
    var _leftColumn = _pageSize * .6 - 40;
    var _rightColumn = _pageSize * .4 - 60;

    return Center(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        width: _pageSize,
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
        child: SingleChildScrollView(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(right: 10),
                width: _leftColumn,
                child: Column(
                  children: [
                    MainTitleWidget(),
                    SummaryWidget(),
                    ExperiencesWidget(),
                    EducationWidget(),
                  ],
                ),
              ),
              Container(
                width: _rightColumn,
                padding: const EdgeInsets.only(left: 10),
                child: Column(
                  children: [
                    PersonalInfoWidget(),
                    SkillsWidget(),
                    LanguagesWidget(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
