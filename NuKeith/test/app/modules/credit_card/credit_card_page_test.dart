import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_pattern/bloc_pattern_test.dart';

import 'package:live/app/modules/credit_card/credit_card_page.dart';

main() {
  testWidgets('CreditCardPage has title', (WidgetTester tester) async {
    await tester
        .pumpWidget(buildTestableWidget(CreditCardPage(title: 'CreditCard')));
    final titleFinder = find.text('CreditCard');
    expect(titleFinder, findsOneWidget);
  });
}
