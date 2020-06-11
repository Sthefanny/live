import 'package:flutter/material.dart';

import 'common/utils/page_routes.dart';

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
          ),
          textTheme: TextTheme(
            display1: TextStyle(fontSize: 16),
          ),
        ),
      onGenerateRoute: PageRoutes.routes,
      debugShowCheckedModeBanner: false,
    );
  }
}
