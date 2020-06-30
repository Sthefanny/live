import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class InfoItemWidget extends StatelessWidget {
  final String title;
  final String content;
  final bool isLink;

  const InfoItemWidget({Key key, @required this.title, @required this.content, @required this.isLink}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          buildTitle(),
          buildContent(),
        ],
      ),
    );
  }

  Widget buildTitle() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Text(title, style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18)),
    );
  }

  Widget buildContent() {
    return InkWell(
      child: Text(
        content,
        style: TextStyle(fontSize: 16, color: isLink ? Colors.purple : Colors.black),
      ),
      onTap: isLink ? _launchURL : () {},
    );
  }

  _launchURL() async {
    var url = 'http://$content';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
