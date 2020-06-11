import 'package:api_integration/app/modules/home/pages/details/details_page.dart';

import 'pages/details/details_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../shared/repositories/ricky_morty_repository.dart';
import 'home_controller.dart';
import 'home_page.dart';

class HomeModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => DetailsController(i.get<RickyMortyRepository>())),
        Bind((i) => HomeController(i.get<RickyMortyRepository>())),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => HomePage()),
        Router('/details', child: (_, args) => DetailsPage(id: args.data['id'])),
      ];

  static Inject get to => Inject<HomeModule>.of();
}
