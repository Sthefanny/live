// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'details_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$DetailsController on _DetailsControllerBase, Store {
  final _$pokemonDetailAtom =
      Atom(name: '_DetailsControllerBase.pokemonDetail');

  @override
  PokeSpecies get pokemonDetail {
    _$pokemonDetailAtom.reportRead();
    return super.pokemonDetail;
  }

  @override
  set pokemonDetail(PokeSpecies value) {
    _$pokemonDetailAtom.reportWrite(value, super.pokemonDetail, () {
      super.pokemonDetail = value;
    });
  }

  final _$getPokemonDetailsAsyncAction =
      AsyncAction('_DetailsControllerBase.getPokemonDetails');

  @override
  Future<void> getPokemonDetails(int id) {
    return _$getPokemonDetailsAsyncAction
        .run(() => super.getPokemonDetails(id));
  }

  @override
  String toString() {
    return '''
pokemonDetail: ${pokemonDetail}
    ''';
  }
}
