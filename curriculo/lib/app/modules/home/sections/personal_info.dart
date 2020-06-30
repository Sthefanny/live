import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../home_controller.dart';
import '../models/cv_model.dart';
import '../widgets/info_item.dart';
import '../widgets/title.dart';

class PersonalInfoWidget extends StatefulWidget {
  @override
  _PersonalInfoWidgetState createState() => _PersonalInfoWidgetState();
}

class _PersonalInfoWidgetState extends ModularState<PersonalInfoWidget, HomeController> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Observer(builder: (_) {
          return TitleWidget(
            icon: FontAwesomeIcons.solidUser,
            title: controller.cvModel?.personalInfo?.sectionTitle ?? '',
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
        children: getListItems(controller.cvModel?.personalInfo?.personalInfoData),
      );
    });
  }

  List<Widget> getListItems(List<PersonalInfoData> items) {
    var listItems = List<Widget>();
    items?.forEach((item) {
      listItems.add(InfoItemWidget(
        title: item.title ?? '',
        content: item.content ?? '',
        isLink: item.isLink ?? false,
      ));
    });

    return listItems;
  }
}
