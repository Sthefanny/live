import 'package:mobx/mobx.dart';
part 'login_controller.g.dart';

class LoginController = _LoginControllerBase with _$LoginController;

abstract class _LoginControllerBase with Store {
  @observable
  String name = '';
  @observable
  String password = '';

  @computed
  bool get isValid => name != null && name.isNotEmpty && password != null && password.isNotEmpty;

  @action
  changeName(String value) => name = value;
  @action
  changePassword(String value) => password = value;

  bool submit() {
    if (isValid) {
      if (name == 'Stel' && password == 'niver') {
        return true;
      } else {
        return false;
      }
    }
    return false;
  }
}
