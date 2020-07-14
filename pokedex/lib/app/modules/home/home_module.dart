import 'package:flutter_modular/flutter_modular.dart';

import '../details/details_controller.dart';
import '../details/details_page.dart';
import '../qr_code/qr_code_controller.dart';
import '../qr_code/qr_code_page.dart';
import 'home_controller.dart';
import 'home_page.dart';

class HomeModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => HomeController(i())),
        Bind((i) => DetailsController(i())),
        Bind((i) => QrCodeController()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => HomePage()),
        Router('/details', child: (_, args) => DetailsPage(pokemon: args.data['pokemon'])),
        Router('/qr_code', child: (_, args) => QrCodePage()),
      ];

  static Inject get to => Inject<HomeModule>.of();
}
