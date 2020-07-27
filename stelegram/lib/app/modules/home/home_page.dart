import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

import '../../../common/configs/colors_config.dart';
import '../../../common/configs/themes_config.dart';
import 'home_controller.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        margin: EdgeInsets.all(10),
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: <Widget>[
            _buildMessages(),
            _buildBottom(),
          ],
        ),
      ),
    );
  }

  Widget _buildMessages() {
    return Expanded(
      child: StreamBuilder<QuerySnapshot>(
        stream: Firestore.instance.collection('ChatMessage').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) return LinearProgressIndicator();

          return _buildList(snapshot.data.documents);
        },
      ),
    );
  }

  Widget _buildList(List<DocumentSnapshot> list) {
    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (_, index) {
        return _buildListItem(list[index]);
      },
    );
  }

  Widget _buildListItem(DocumentSnapshot data) {
    var timestamp = data.data['timestamp'];
    var time = DateFormat.Hm().format(DateTime.fromMillisecondsSinceEpoch(timestamp));
    return Card(
      child: ListTile(
        title: Text(data.data['name'] ?? ''),
        subtitle: Text(data.data['message'] ?? ''),
        trailing: Text(time ?? ''),
      ),
    );
  }

  Widget _buildBottom() {
    return Row(
      children: <Widget>[
        _buildTextinput(),
        _buildSendButton(),
      ],
    );
  }

  Widget _buildTextinput() {
    return Expanded(
      child: TextField(
        onChanged: controller.changeMessageInput,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(15),
          filled: true,
          fillColor: ColorsConfig.surface,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: ColorsConfig.outline, width: 1),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: ColorsConfig.outline, width: 1),
            borderRadius: BorderRadius.circular(10),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: ColorsConfig.outline, width: 1),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: ColorsConfig.outline, width: 1),
            borderRadius: BorderRadius.circular(10),
          ),
          hintText: 'Digite sua mensagem...',
          hintStyle: defaultThemeData.textTheme.bodyText1.merge(TextStyle(color: ColorsConfig.onSurfaceDisabled)),
        ),
      ),
    );
  }

  Widget _buildSendButton() {
    return FloatingActionButton(
      mini: true,
      onPressed: controller.addMessage,
      child: FaIcon(
        FontAwesomeIcons.solidPaperPlane,
        size: 15,
      ),
      elevation: 4,
    );
  }
}
