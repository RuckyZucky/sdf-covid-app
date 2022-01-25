import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sdf_covid/pages/germany/germany_page.dart';
import 'package:sdf_covid/pages/germany/widgets/bar_chart/covid_charts.dart';
import 'package:sdf_covid/util/widgets/date_filter.dart';


void main() {
  testWidgets('GermanyPage displays correct title', (WidgetTester tester) async {
    const testWidget = MaterialApp(
      home: GermanyPage(),
    );

    await tester.pumpWidget(testWidget);
    await tester.pumpAndSettle();

    final appBar = find.byType(AppBar);
    expect(appBar, findsOneWidget);
    expect(find.descendant(of: appBar, matching: find.text('Deutschland')), findsOneWidget);
  });

  testWidgets('GermanyPage displays DateFilter', (WidgetTester tester) async {
    const testWidget = MaterialApp(
      home: GermanyPage(),
    );

    await tester.pumpWidget(testWidget);
    await tester.pumpAndSettle();

    final dateFilter = find.byType(DateFilter);
    expect(dateFilter, findsOneWidget);
  });

  testWidgets('GermanyPage displays CovidCharts', (WidgetTester tester) async {
    const testWidget = MaterialApp(
      home: GermanyPage(),
    );

    await tester.pumpWidget(testWidget);
    await tester.pumpAndSettle();

    final charts = find.byType(CovidCharts);
    expect(charts, findsOneWidget);
  });
}
