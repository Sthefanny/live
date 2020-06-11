import 'package:flutter/material.dart';
import 'package:live/app/modules/credit_card/credit_card_module.dart';
import 'package:live/app/modules/home/home_module.dart';

class PageRoutes {
  static const String homeRoute = '/home';
  static const String creditCardRoute = '/creditCard';

  static Route routes(RouteSettings settings) {
    switch (settings.name) {
      case PageRoutes.creditCardRoute:
        return MaterialPageRoute(builder: (_) => CreditCardModule());
      case PageRoutes.homeRoute:
      default:
        return MaterialPageRoute(builder: (_) => HomeModule());
    }
  }
}
