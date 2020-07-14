import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AlbumCardWidget extends StatefulWidget {
  @override
  _AlbumCardWidgetState createState() => _AlbumCardWidgetState();
}

class _AlbumCardWidgetState extends State<AlbumCardWidget> {
  Size _size;

  @override
  Widget build(BuildContext context) {
    _size = MediaQuery.of(context).size;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      height: _size.height * .6,
      width: _size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(color: Colors.black, offset: Offset(0.0, 4), blurRadius: 10, spreadRadius: 0.1),
        ],
        color: Colors.grey,
      ),
      child: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              buildTop(),
              buildContentTop(),
            ],
          ),
          buildAlbumImage(),
          buildPlayButton(),
        ],
      ),
    );
  }

  Widget buildTop() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Row(
        children: <Widget>[
          buildArtistImage(),
          buildTitleAndSubtitle(),
          buildAddButton(),
        ],
      ),
    );
  }

  Widget buildArtistImage() {
    return CircleAvatar(
      backgroundColor: Colors.yellow,
      child: Image.network(
        'https://www.uokpl.rs/fpng/f/514-5148898_post-malone-transparent.png',
        width: 50,
      ),
    );
  }

  Widget buildTitleAndSubtitle() {
    return Expanded(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            buildTitle('Perfect Oldies'),
            buildSubtitle('July 2018'),
          ],
        ),
      ),
    );
  }

  Widget buildTitle(String text) {
    return Text(text, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500));
  }

  Widget buildSubtitle(String text) {
    return Text(text, style: TextStyle(fontSize: 11));
  }

  Widget buildAddButton() {
    return FloatingActionButton(
      child: FaIcon(FontAwesomeIcons.plus, size: 15),
      mini: true,
      elevation: 0,
      onPressed: () {},
    );
  }

  Widget buildContentTop() {
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          buildAlbumTitle('80s Smash Hits'),
          buildAlbumInfos(),
        ],
      ),
    );
  }

  Widget buildAlbumTitle(String text) {
    return Text(text, style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500));
  }

  Widget buildAlbumInfos() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        buildAlbumInfo(text: '9.543', icon: FontAwesomeIcons.chartLine),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 8),
        ),
        buildAlbumInfo(text: '5h 35m', icon: FontAwesomeIcons.clock),
      ],
    );
  }

  Widget buildAlbumInfo({@required String text, @required IconData icon}) {
    return Row(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(right: 5),
          child: FaIcon(icon, size: 10),
        ),
        Text(text, style: TextStyle(fontSize: 12)),
      ],
    );
  }

  Widget buildAlbumImage() {
    return Positioned(
      bottom: 0,
      child: Container(
        child: Image.network(
          'https://www.uokpl.rs/fpng/f/514-5148898_post-malone-transparent.png',
          width: 300,
        ),
      ),
    );
  }

  Widget buildPlayButton() {
    return Positioned(
      bottom: 10,
      left: _size.width / 2.5,
      child: FloatingActionButton(
        backgroundColor: Colors.green,
        child: FaIcon(FontAwesomeIcons.play, size: 15),
        elevation: 0,
        onPressed: () {},
      ),
    );
  }
}
