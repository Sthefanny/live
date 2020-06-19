// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on _HomeControllerBase, Store {
  final _$stateModelAtom = Atom(name: '_HomeControllerBase.stateModel');

  @override
  StateModel get stateModel {
    _$stateModelAtom.reportRead();
    return super.stateModel;
  }

  @override
  set stateModel(StateModel value) {
    _$stateModelAtom.reportWrite(value, super.stateModel, () {
      super.stateModel = value;
    });
  }

  final _$getStateAsyncAction = AsyncAction('_HomeControllerBase.getState');

  @override
  Future<void> getState() {
    return _$getStateAsyncAction.run(() => super.getState());
  }

  final _$turnLightAsyncAction = AsyncAction('_HomeControllerBase.turnLight');

  @override
  Future<dynamic> turnLight(String lightColor, String state) {
    return _$turnLightAsyncAction.run(() => super.turnLight(lightColor, state));
  }

  @override
  String toString() {
    return '''
stateModel: ${stateModel}
    ''';
  }
}
