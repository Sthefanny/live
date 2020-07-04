// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on _HomeControllerBase, Store {
  final _$pokemonListAtom = Atom(name: '_HomeControllerBase.pokemonList');

  @override
  Pokemons get pokemonList {
    _$pokemonListAtom.reportRead();
    return super.pokemonList;
  }

  @override
  set pokemonList(Pokemons value) {
    _$pokemonListAtom.reportWrite(value, super.pokemonList, () {
      super.pokemonList = value;
    });
  }

  final _$getPokemonAsyncAction = AsyncAction('_HomeControllerBase.getPokemon');

  @override
  Future<void> getPokemon() {
    return _$getPokemonAsyncAction.run(() => super.getPokemon());
  }

  @override
  String toString() {
    return '''
pokemonList: ${pokemonList}
    ''';
  }
}
