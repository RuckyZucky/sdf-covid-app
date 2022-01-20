// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sdf_covid/pages/germany/germany_page.dart';

import 'package:sdf_covid/pages/home/home_page.dart';

void main() {
  testWidgets('GermanyPage test', (WidgetTester tester) async {
    const testWidget = MaterialApp(
      home: GermanyPage(),
    );

    // Widget rendern
    await tester.pumpWidget(testWidget);
    // Warten bis keine neuen Frames gerendert werden müssen (z.B. Animationen sind fertig)
    await tester.pumpAndSettle();

    /*final barChart = find.byType(BarChart);
    expect(barChart, findsOneWidget);
    expect(find.descendant(of: barChart, matching: find.text('Fälle')), findsOneWidget);*/
  });
}
