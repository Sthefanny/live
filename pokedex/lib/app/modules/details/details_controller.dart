import 'package:mobx/mobx.dart';

import '../../common/models/pokemons_poke_api_model.dart';

part 'details_controller.g.dart';

class DetailsController = _DetailsControllerBase with _$DetailsController;

abstract class _DetailsControllerBase with Store {}
