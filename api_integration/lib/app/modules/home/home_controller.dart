import 'package:mobx/mobx.dart';

import '../../shared/models/character_model.dart';
import '../../shared/repositories/ricky_morty_repository.dart';

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final RickyMortyRepository _repository;

  _HomeControllerBase(this._repository);

  Future<Characters> getCharacters() async {
    var result = await _repository.fetchPost();
    return Characters.fromJson(result);
  }
}
