import 'package:live/app/common/repositories/credit_card_repository.dart';
import 'package:live/app/modules/credit_card/credit_card_bloc.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:live/app/modules/credit_card/credit_card_page.dart';

export 'package:live/app/common/repositories/credit_card_repository.dart';
export 'package:live/app/modules/credit_card/credit_card_bloc.dart';

class CreditCardModule extends ModuleWidget {
  @override
  List<Bloc> get blocs => [
        Bloc((i) => CreditCardBloc(repository: to.getDependency())),
      ];

  @override
  List<Dependency> get dependencies => [Dependency((d) => CreditCardRepository())];

  @override
  Widget get view => CreditCardPage();

  static Inject get to => Inject<CreditCardModule>.of();
}
