import 'package:curriculo/app/modules/home/models/cv_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../home_controller.dart';
import '../widgets/title.dart';

class EducationWidget extends StatefulWidget {
  @override
  _EducationWidgetState createState() => _EducationWidgetState();
}

class _EducationWidgetState extends ModularState<EducationWidget, HomeController> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Observer(builder: (_) {
            return Observer(builder: (_) {
              return TitleWidget(title: controller.cvModel?.education?.sectionTitle ?? '', icon: FontAwesomeIcons.graduationCap, hasMargin: false);
            });
          }),
          buildListItems(),
        ],
      ),
    );
  }

  Widget buildListItems() {
    return Observer(builder: (_) {
      if (controller?.cvModel?.education?.educationData != null) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: getListItems(controller.cvModel.education.educationData),
        );
      }
      return const SizedBox();
    });
  }

  List<Widget> getListItems(List<EducationData> items) {
    var listItems = List<Widget>();
    items?.forEach((item) {
      listItems.add(buildContent(item));
    });

    return listItems;
  }

  Widget buildContent(EducationData item) {
    return Stack(
      children: [
        buildText(item),
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

  Widget buildText(EducationData item) {
    return Container(
      margin: EdgeInsets.only(left: 16),
      padding: EdgeInsets.only(bottom: 20, left: 25, top: 10),
      decoration: BoxDecoration(
        border: Border(left: BorderSide(color: Color(0xFFd5d6d6), width: 3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(item?.institution ?? '', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
          getDateText(item),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Text(item?.course ?? '', style: TextStyle(fontSize: 14)),
          ),
        ],
      ),
    );
  }

  Widget getDateText(EducationData item) {
    if (item?.finalDate != null && item.finalDate.isNotEmpty) {
      return Text('${item?.city} - ${item?.country} - ${item?.finalDate}', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500));
    } else {
      return Text('${item?.city} - ${item?.country} - ${item?.initialDate}', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500));
    }
  }
}
