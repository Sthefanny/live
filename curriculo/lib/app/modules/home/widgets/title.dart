import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TitleWidget extends StatelessWidget {
  final IconData icon;
  final String title;
  final bool hasMargin;

  const TitleWidget({Key key, @required this.icon, @required this.title, this.hasMargin}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: hasMargin == false ? 0 : 10, top: hasMargin == false ? 0 : 20),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: FaIcon(icon, size: 35),
          ),
          Text(
            title,
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.w400),
          ),
        ],
      ),
    );
  }
}
