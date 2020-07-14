import 'package:flutter/material.dart';

import 'album_card_widget.dart';

class ArtistListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        AlbumCardWidget(),
        AlbumCardWidget(),
        AlbumCardWidget(),
        AlbumCardWidget(),
        AlbumCardWidget(),
      ],
    );
  }
}
