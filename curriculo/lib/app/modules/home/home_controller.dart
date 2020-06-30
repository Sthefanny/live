import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:mobx/mobx.dart';

import 'models/cv_model.dart';

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  @observable
  String language = 'pt_BR';

  @observable
  CvModel cvModel = CvModel();

  Future<String> _loadFromAsset() async {
    return await rootBundle.loadString("assets/language/$language.json");
  }

  @action
  Future<void> getCvModel() async {
    String jsonString = await _loadFromAsset();
    final jsonResponse = jsonDecode(jsonString);
    cvModel = CvModel.fromJson(jsonResponse);
  }

  @action
  void changeLanguage(String value) {
    language = value;
    getCvModel();
  }
}
