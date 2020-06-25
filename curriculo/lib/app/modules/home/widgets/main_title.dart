import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MainTitleWidget extends StatefulWidget {
  @override
  _MainTitleWidgetState createState() => _MainTitleWidgetState();
}

class _MainTitleWidgetState extends State<MainTitleWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          buildIcon(),
          Padding(
            padding: const EdgeInsets.only(left: 5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildTitle(),
                buildSubTitle(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildIcon() {
    return FaIcon(
      FontAwesomeIcons.globeAmericas,
      size: 40,
    );
  }

  Widget buildTitle() {
    return Text('Sthefanny Gonzaga', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500));
  }

  Widget buildSubTitle() {
    return Text('Flutter Developer', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500));
  }
}
