import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sdf_covid/pages/germany/widgets/date_filter/date_filter.dart';

void main() {
  testWidgets('DateFilter should display all filter options',
      (WidgetTester tester) async {
    final testWidget = MaterialApp(
        home: DefaultTabController(
            length: 4,
            initialIndex: 3,
            child: Scaffold(
              appBar: AppBar(
                  title: const Text('Deutschland'), bottom: const DateFilter()),
              body: const Center(),
            )));

    await tester.pumpWidget(testWidget);
    await tester.pumpAndSettle();

    expect(find.text('Woche'), findsOneWidget);
    expect(find.text('Monat'), findsOneWidget);
    expect(find.text('Jahr'), findsOneWidget);
    expect(find.text('Gesamt'), findsOneWidget);
  });
}
