import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sdf_covid/data/rki_data.dart';
import 'package:sdf_covid/data/states.dart';
import 'package:sdf_covid/pages/federalstates/widgets/state_filter/fed_states_drop.dart';
import 'package:sdf_covid/pages/germany/widgets/bar_chart/bar_chart_container.dart';
import 'package:sdf_covid/pages/germany/widgets/date_filter/date_filter.dart';

void main() {
  testWidgets('DateFilter should display all filter options', (WidgetTester tester) async {
    const testWidget = MaterialApp(
        home: FedStateFilter()
    );

   //
    await tester.pumpWidget(testWidget);
    expect((tester.widget(find.byKey(Key('States'))) as DropdownButton).value,
        equals('BLN'));
    await tester.pump();
    await tester.tap(find.byKey(Key('States')));
    await tester.tap(find.byKey(Key("BAY")));
    await tester.pumpAndSettle();
    expect((tester.widget(find.byKey(Key('States'))) as DropdownButton).value,
        equals(FederalState.BY));
   //
   //  await tester.pumpAndSettle();
   //
   // await tester.tap(find.text('Berlin').first);
   //  await tester.pump();
   //  await tester.tap(find.text('Bayern'));
    // await tester.tap(find.text('Baden-Würtemberg').hitTestable(), findsOneWidget);
    // await tester.tap(find.text('Brandenburg').hitTestable(), findsOneWidget);
    // await tester.tap(find.text('Bremen').hitTestable(), findsOneWidget);
    // await tester.tap(find.text('Hamburg').hitTestable(), findsOneWidget);
    // expect(find.text('Hessem').hitTestable(), findsOneWidget);
    // expect(find.text('Mecklenburg-Vorpommern').hitTestable(), findsOneWidget);
    // expect(find.text('Nordrheom-Westfalen').hitTestable(), findsOneWidget);
    // expect(find.text('Niedersachsen').hitTestable(), findsOneWidget);
    // expect(find.text('Rheinland-Pfalz').hitTestable(), findsOneWidget);
    // expect(find.text('Saarland').hitTestable(), findsOneWidget);
    // expect(find.text('Sachsen').hitTestable(), findsOneWidget);
    // expect(find.text('Sachsen-Anhalt').hitTestable(), findsOneWidget);
    // expect(find.text('Schleswig-Holstein').hitTestable(), findsOneWidget);
    // expect(find.text('Thüringen').hitTestable(), findsOneWidget);


  });

}