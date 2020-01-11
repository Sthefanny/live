import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:live/app/app_module.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]).then((_) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: Color(0xFF76009c)));
    runApp(AppModule());
  });
}
