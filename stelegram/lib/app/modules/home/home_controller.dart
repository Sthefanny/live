import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mobx/mobx.dart';

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final _db = Firestore.instance.collection('ChatMessage');

  @observable
  String messageInput;

  @action
  changeMessageInput(String value) => messageInput = value;

  void addMessage() {
    _db.document().setData(
      {
        'name': 'Stel',
        'message': messageInput,
        'timestamp': DateTime.now().millisecondsSinceEpoch,
      },
    );
  }
}
