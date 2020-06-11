import 'package:api_integration/app/shared/repositories/ricky_morty_repository.dart';
import 'package:mobx/mobx.dart';

import '../../../../shared/models/character_model.dart';

part 'details_controller.g.dart';

class DetailsController = _DetailsControllerBase with _$DetailsController;

abstract class _DetailsControllerBase with Store {
  final RickyMortyRepository _repository;

  _DetailsControllerBase(this._repository);

  @observable
  Results details = Results();

  @action
  Future<void> getDetails(int id) async {
    var result = await _repository.getDetailsById(id);
    details = Results.fromJson(result);
  }
}
