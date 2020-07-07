import 'package:flutter_modular/flutter_modular.dart';

import '../details/details_controller.dart';
import '../details/details_page.dart';
import 'home_controller.dart';
import 'home_page.dart';

class HomeModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => HomeController(i())),
        Bind((i) => DetailsController()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => HomePage()),
        Router('/details', child: (_, args) => DetailsPage(pokemon: args.data['pokemon'])),
      ];

  static Inject get to => Inject<HomeModule>.of();
}
