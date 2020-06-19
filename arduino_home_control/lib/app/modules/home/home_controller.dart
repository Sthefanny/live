import 'package:arduino_home_control/app/core/models/state_model.dart';
import 'package:mobx/mobx.dart';

import '../../core/repositories/esp_repository.dart';

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final EspRepository _repository;

  _HomeControllerBase(this._repository);

  @observable
  StateModel stateModel = StateModel();

  @action
  Future<void> getState() async {
    var result = await _repository.getState();
    var model = StateModel.fromJson(result);
    stateModel = model;
  }

  @action
  Future turnLight(String lightColor, String state) async {
    var result = await _repository.turnLight(lightColor, state);
    var model = LedModel.fromJson(result);
    stateModel = StateModel(temperature: stateModel.temperature, humidity: stateModel.humidity, led: model);
  }
}
