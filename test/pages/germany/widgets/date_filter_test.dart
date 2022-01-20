import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sdf_covid/data/rki_data.dart';
import 'package:sdf_covid/pages/germany/widgets/bar_chart/bar_chart_container.dart';
import 'package:sdf_covid/pages/germany/widgets/date_filter/date_filter.dart';

void main() {
  testWidgets('DateFilter should display all filter options', (WidgetTester tester) async {
    const testWidget = MaterialApp(
        home: DateFilter()
    );

    await tester.pumpWidget(testWidget);
    await tester.pumpAndSettle();

    expect(find.text('Woche'), findsOneWidget);
    expect(find.text('Monat'), findsOneWidget);
    expect(find.text('Jahr'), findsOneWidget);
    expect(find.text('Gesamt'), findsOneWidget);
  });

}
