// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:sdf_covid/pages/home/home_page.dart';

void main() {
  testWidgets('HomePage displays correct title', (WidgetTester tester) async {
    const testWidget = MaterialApp(
      home: HomePage(),
    );

    // Widget rendern
    await tester.pumpWidget(testWidget);
    // Warten bis keine neuen Frames gerendert werden müssen (z.B. Animationen sind fertig)
    await tester.pumpAndSettle();

    final appBar = find.byType(AppBar);
    expect(appBar, findsOneWidget);
    expect(find.descendant(of: appBar, matching: find.text('Aktuelle COVID-19 Situation - Deutschland')), findsOneWidget);
  });
}
