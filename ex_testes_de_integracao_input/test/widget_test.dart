import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ex_testes_de_integracao_input/main.dart';

void main() {
  testWidgets('input text field', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    await tester.tap(find.byKey(const Key('text-field')));
    await tester.enterText(find.byKey(const Key('text-field')), 'thiago');
    await tester.testTextInput.receiveAction(TextInputAction.done);
    await tester.tap(find.byKey(const Key('button-ok')));

    expect(find.text('thiago'), findsOneWidget);
  });
}
