// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ex_testes_de_integracao/main.dart';

void main() {
  testWidgets('Counter increments and decrements test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that our counter starts at 0.
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // Tap the '+' icon and trigger a frame.
    for(int i=0 ; i<10 ; i++) {
      await tester.tap(find.byKey(const Key('add')));
    }

    for(int i=0 ; i<5 ; i++) {
      await tester.tap(find.byKey(const Key('sub')));
    }
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.text('0'), findsNothing);
    expect(find.text('5'), findsOneWidget);
  });
}
