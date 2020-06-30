// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on _HomeControllerBase, Store {
  final _$languageAtom = Atom(name: '_HomeControllerBase.language');

  @override
  String get language {
    _$languageAtom.reportRead();
    return super.language;
  }

  @override
  set language(String value) {
    _$languageAtom.reportWrite(value, super.language, () {
      super.language = value;
    });
  }

  final _$cvModelAtom = Atom(name: '_HomeControllerBase.cvModel');

  @override
  CvModel get cvModel {
    _$cvModelAtom.reportRead();
    return super.cvModel;
  }

  @override
  set cvModel(CvModel value) {
    _$cvModelAtom.reportWrite(value, super.cvModel, () {
      super.cvModel = value;
    });
  }

  final _$getCvModelAsyncAction = AsyncAction('_HomeControllerBase.getCvModel');

  @override
  Future<void> getCvModel() {
    return _$getCvModelAsyncAction.run(() => super.getCvModel());
  }

  final _$_HomeControllerBaseActionController =
      ActionController(name: '_HomeControllerBase');

  @override
  void changeLanguage(String value) {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.changeLanguage');
    try {
      return super.changeLanguage(value);
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
language: ${language},
cvModel: ${cvModel}
    ''';
  }
}
