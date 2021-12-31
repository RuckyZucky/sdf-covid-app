import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:sdf_covid/data/cases.dart';

void main() {
  test('Sample json should be parsed correctly', () async {
    final file = File('test/data/cases.json');
    final json = jsonDecode(await file.readAsString());
    final cases = CasesData.fromJson(json);

    expect(cases.data.length, 3);

    expect(cases.data[0].cases, 2);
    expect(cases.data[0].date, DateTime.utc(2020, 01, 01));
  });
}
