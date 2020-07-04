// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'details_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$DetailsController on _DetailsControllerBase, Store {
  final _$pokemonAtom = Atom(name: '_DetailsControllerBase.pokemon');

  @override
  PokemonsPokeApi get pokemon {
    _$pokemonAtom.reportRead();
    return super.pokemon;
  }

  @override
  set pokemon(PokemonsPokeApi value) {
    _$pokemonAtom.reportWrite(value, super.pokemon, () {
      super.pokemon = value;
    });
  }

  final _$getPokemonAsyncAction =
      AsyncAction('_DetailsControllerBase.getPokemon');

  @override
  Future<void> getPokemon(String num) {
    return _$getPokemonAsyncAction.run(() => super.getPokemon(num));
  }

  @override
  String toString() {
    return '''
pokemon: ${pokemon}
    ''';
  }
}
