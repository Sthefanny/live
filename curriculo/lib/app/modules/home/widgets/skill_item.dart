import 'package:flutter/material.dart';

class SkillItem extends StatelessWidget {
  final String title;
  final int level;
  final int total;

  const SkillItem({Key key, @required this.level, @required this.total, @required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          buildTitle(),
          Row(
            children: getItem(),
          ),
        ],
      ),
    );
  }

  Widget buildTitle() {
    return Text(title, style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500));
  }

  List<Widget> getItem() {
    var listItems = List<Widget>();

    for (var i = 0; i < total; i++) {
      var color = Color(0xFFD6D5D6);
      if (i < level) {
        color = Color(0xFF282c34);
      }
      listItems.add(buildCircle(color: color));
    }

    return listItems;
  }

  Widget buildCircle({@required Color color}) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 3),
      width: 15,
      height: 15,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
      ),
    );
  }
}
