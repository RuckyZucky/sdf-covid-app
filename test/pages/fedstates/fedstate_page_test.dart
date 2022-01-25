// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sdf_covid/pages/federalstates/fed_states_page.dart';
import 'package:sdf_covid/pages/federalstates/widgets/bar_chart/covid_charts.dart';
import 'package:sdf_covid/util/widgets/date_filter.dart';

void main() {
  testWidgets('FederalPage displays correct title', (WidgetTester tester) async {
    const testWidget = MaterialApp(
      home: FederalPage(),
    );

    await tester.pumpWidget(testWidget);
    await tester.pumpAndSettle();

    final appBar = find.byType(AppBar);
    expect(appBar, findsOneWidget);
    expect(find.descendant(of: appBar, matching: find.text('Bundesländer')), findsOneWidget);
  });

  testWidgets('FederalPage displays DateFilter', (WidgetTester tester) async {
    const testWidget = MaterialApp(
      home: FederalPage(),
    );

    await tester.pumpWidget(testWidget);
    await tester.pumpAndSettle();

    final dateFilter = find.byType(DateFilter);
    expect(dateFilter, findsOneWidget);
  });

  testWidgets('FederalPage displays CovidCharts', (WidgetTester tester) async {
    const testWidget = MaterialApp(
      home: FederalPage(),
    );

    await tester.pumpWidget(testWidget);
    await tester.pumpAndSettle();

    final charts = find.byType(CovidCharts);
    expect(charts, findsOneWidget);
  });
}
