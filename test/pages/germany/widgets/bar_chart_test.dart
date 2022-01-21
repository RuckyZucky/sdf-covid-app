import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sdf_covid/data/rki_data.dart';
import 'package:sdf_covid/pages/germany/widgets/bar_chart/bar_chart_container.dart';

void main() {

  testWidgets('ChartContainer should display title', (WidgetTester tester) async {
    print("test");
    await initializeDateFormatting();

    print("test");
    final List<Data> data = [Data(1, DateTime.now())];
    print("test");

    final testWidget = MaterialApp(
      home: BarChartContainer(title: "Fälle", data: data)
    );
    print("test");

    await tester.pumpWidget(testWidget);
    print("test");
    await tester.pumpAndSettle();
    print("test");

    expect(find.text('Fälle'), findsOneWidget);
  });

  testWidgets('ChartContainer should render BarChart', (WidgetTester tester) async {
    final List<Data> data = [Data(1, DateTime.now())];

    final testWidget = MaterialApp(
        home: BarChartContainer(title: "Fälle", data: data)
    );

    await tester.pumpWidget(testWidget);
    await tester.pumpAndSettle();

    final barChart = find.byType(BarChart);
    expect(barChart, findsOneWidget);
  });

  testWidgets('ChartContainer should not display BarChart when no data is provided', (WidgetTester tester) async {
    final List<Data> data = [];

    final testWidget = MaterialApp(
        home: BarChartContainer(title: "Fälle", data: data)
    );

    await tester.pumpWidget(testWidget);
    await tester.pumpAndSettle();

    final barChart = find.byType(BarChart);
    expect(barChart, findsNothing);
  });

  testWidgets('ChartContainer should display error message when no data is provided', (WidgetTester tester) async {
    final List<Data> data = [];

    final testWidget = MaterialApp(
        home: BarChartContainer(title: "Fälle", data: data)
    );

    await tester.pumpWidget(testWidget);
    await tester.pumpAndSettle();

    expect(find.text("No data provided for Fälle"), findsOneWidget);
  });
}
