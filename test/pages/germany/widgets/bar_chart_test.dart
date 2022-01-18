import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sdf_covid/data/rki_data.dart';
import 'package:sdf_covid/pages/germany/widgets/bar_chart/bar_chart_container.dart';

void main() {
  testWidgets('ChartContainer should display title', (WidgetTester tester) async {
    /*final file = File('test/data/cases.json');
    final json = jsonDecode(await file.readAsString());

    final data = DataContainer.fromJsonGermany(json, Data.casesFromJson).data;*/

    //final one_data = Data(10, DateTime.parse(""));

    const List<Data> data = [
    ];

    const chart = BarChartContainer(title: "Fälle", data: data);



    const testWidget = MaterialApp(
      home: chart
    );

    await tester.pumpWidget(chart);
    await tester.pumpAndSettle();

    expect(find.text('Fälle'), findsOneWidget);
  });

}
