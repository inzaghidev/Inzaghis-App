// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:inzaghi_app/main.dart';

void main() {
  testWidgets('home opens the apps section without a new route',
      (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());
    await tester.pumpAndSettle();

    expect(find.text('Open Apps'), findsOneWidget);

    await tester.tap(find.text('Open Apps'));
    await tester.pumpAndSettle();

    expect(find.text('Widgets'), findsOneWidget);
    expect(find.text('Converters'), findsOneWidget);

    await tester.fling(find.byType(PageView), const Offset(400, 0), 1000);
    await tester.pumpAndSettle();

    expect(find.text('A little more useful\nevery day.'), findsOneWidget);
  });
}
