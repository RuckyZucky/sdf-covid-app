import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sdf_covid/data/states.dart';
import 'package:sdf_covid/pages/federalstates/widgets/state_filter/fed_states_drop.dart';

void main() {
  testWidgets('FedStatesFilter should display all filter options', (WidgetTester tester) async {
    const testWidget = MaterialApp(
      home: Material(
        child: FedStateFilter(),

      ),
    );
    await tester.pumpWidget(testWidget);
    await tester.pump();
    expect((tester.widget(find.byKey(const Key('States'))) as DropdownButton).value,
        equals(FederalState.BE));

    await tester.tap(find.byKey(const Key('States')));
    await tester.tap(find.byKey(const Key('BLN')));
    await tester.tap(find.byKey(const Key('States')));
    await tester.tap(find.byKey(const Key('BAY')).last);
    await tester.tap(find.byKey(const Key('BAD')).last);
    await tester.tap(find.byKey(const Key('BRE')).last);
    await tester.tap(find.byKey(const Key('HAH')).last);
    await tester.tap(find.byKey(const Key('HES')).last);
    await tester.tap(find.byKey(const Key('MPO')).last);
    await tester.tap(find.byKey(const Key('NRW')).last);
    await tester.tap(find.byKey(const Key('NIE')).last);
    await tester.tap(find.byKey(const Key('SLD')).last);
    await tester.tap(find.byKey(const Key('SAC')).last);
    await tester.tap(find.byKey(const Key('RPF')).last);
    await tester.tap(find.byKey(const Key('SHA')).last);
    await tester.tap(find.byKey(const Key('SHO')).last);
    await tester.tap(find.byKey(const Key('THÜ')).last);
  });

}
