// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'details_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$DetailsController on _DetailsControllerBase, Store {
  final _$detailsAtom = Atom(name: '_DetailsControllerBase.details');

  @override
  Results get details {
    _$detailsAtom.reportRead();
    return super.details;
  }

  @override
  set details(Results value) {
    _$detailsAtom.reportWrite(value, super.details, () {
      super.details = value;
    });
  }

  final _$getDetailsAsyncAction =
      AsyncAction('_DetailsControllerBase.getDetails');

  @override
  Future<void> getDetails(int id) {
    return _$getDetailsAsyncAction.run(() => super.getDetails(id));
  }

  @override
  String toString() {
    return '''
details: ${details}
    ''';
  }
}
