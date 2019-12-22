import 'package:flutter/material.dart';
import 'package:live/app/modules/home/home_module.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Slidy',
      theme: ThemeData(
          primaryColor: Color(0xFF76009c),
          buttonColor: Color(0xFF8a30ac),
          buttonTheme: ButtonThemeData(
            buttonColor: Color(0xFF8a30ac),
          )),
      home: HomeModule(),
      debugShowCheckedModeBanner: false,
    );
  }
}
