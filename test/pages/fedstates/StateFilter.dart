import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sdf_covid/data/rki_data.dart';
import 'package:sdf_covid/data/states.dart';
import 'package:sdf_covid/pages/federalstates/widgets/state_filter/fed_states_drop.dart';
import 'package:sdf_covid/pages/germany/widgets/bar_chart/bar_chart_container.dart';
import 'package:sdf_covid/pages/germany/widgets/date_filter/date_filter.dart';

void main() {
  testWidgets('FedStatesFilter should display all filter options', (WidgetTester tester) async {
    final testWidget = MaterialApp(
      home: Material(
        child: FedStateFilter(),

      ));
    FederalState selectedValue = FederalState.BE;
   //
    await tester.pumpWidget(testWidget);
    await tester.pump();
    expect((tester.widget(find.byKey(Key('States'))) as DropdownButton).value,
        equals(FederalState.BE));

    await tester.tap(find.byKey(Key('States')));
    await tester.tap(find.byKey(Key('BLN')));
    await tester.tap(find.byKey(Key('States')));
    await tester.tap(find.byKey(Key('BAY')).last);
    await tester.tap(find.byKey(Key('BAD')).last);
    await tester.tap(find.byKey(Key('BRE')).last);
    await tester.tap(find.byKey(Key('HAH')).last);
    await tester.tap(find.byKey(Key('HES')).last);
    await tester.tap(find.byKey(Key('MPO')).last);
    await tester.tap(find.byKey(Key('NRW')).last);
    await tester.tap(find.byKey(Key('NIE')).last);
    await tester.tap(find.byKey(Key('SLD')).last);
    await tester.tap(find.byKey(Key('SAC')).last);
    await tester.tap(find.byKey(Key('RPF')).last);
    await tester.tap(find.byKey(Key('SHA')).last);
    await tester.tap(find.byKey(Key('SHO')).last);
    await tester.tap(find.byKey(Key('THÜ')).last);







  });

}