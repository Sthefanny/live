import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_pattern/bloc_pattern_test.dart';

import 'package:live/app/modules/credit_card/credit_card_bloc.dart';
import 'package:live/app/modules/credit_card/credit_card_module.dart';

void main() {
  initModule(CreditCardModule());
  CreditCardBloc bloc;

  setUp(() {
    bloc = CreditCardModule.to.bloc<CreditCardBloc>();
  });

  group('CreditCardBloc Test', () {
    test("First Test", () {
      expect(bloc, isInstanceOf<CreditCardBloc>());
    });
  });
}
