import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sdf_covid/pages/home/widgets/data_text.dart';

void main() {
  testWidgets('DataText should display integer data', (WidgetTester tester) async {
    const double data = 34300; // Datentyp muss double sein, aber der Wert ist ganzzahlig
    const testWidget = MaterialApp(
      home: DataText(
        data: data,
      ),
    );

    await tester.pumpWidget(testWidget);
    await tester.pumpAndSettle();

    expect(find.text('34.300'), findsOneWidget);
  });

  testWidgets('DataText should display decimal data', (WidgetTester tester) async {
    const double data = 245.5;
    const testWidget = MaterialApp(
      home: DataText(
        data: data,
      ),
    );

    await tester.pumpWidget(testWidget);
    await tester.pumpAndSettle();

    expect(find.text('245,5'), findsOneWidget);
  });

  testWidgets('DataText should display "No Data" when no data is submitted', (WidgetTester tester) async {
    const testWidget = MaterialApp(
      home: DataText(),
    );

    await tester.pumpWidget(testWidget);
    await tester.pumpAndSettle();

    expect(find.text('Keine Daten vorhanden'), findsOneWidget);
  });

  testWidgets('DataText should display title', (WidgetTester tester) async {
    const testWidget = MaterialApp(
      home: DataText(
        title: Text('Neue Fälle / 24h')
      ),
    );

    await tester.pumpWidget(testWidget);
    await tester.pumpAndSettle();

    expect(find.text('Neue Fälle / 24h'), findsOneWidget);
  });
}
