import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:show_do_milhao/app/modules/login/login_controller.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends ModularState<LoginPage, LoginController> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Login'),
        ),
        body: Container(
          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          child: Column(
            children: [
              _buildName(),
              _buildPassword(),
              _buildButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildName() {
    return TextField(
      decoration: InputDecoration(
        hintText: 'Nome',
      ),
      onChanged: controller.changeName,
    );
  }

  Widget _buildPassword() {
    return TextField(
      decoration: InputDecoration(
        hintText: 'Senha',
      ),
      onChanged: controller.changePassword,
    );
  }

  Widget _buildButton() {
    return RaisedButton(
      onPressed: () {
        if (controller.submit()) {
          Modular.to.pushReplacementNamed('/home');
        } else {
          _showMyDialog();
        }
      },
      child: Text('Entrar'),
    );
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Deu ruim!'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('This is a demo alert dialog.'),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Fechar'),
              onPressed: () {
                Modular.to.pop();
              },
            ),
          ],
        );
      },
    );
  }
}
