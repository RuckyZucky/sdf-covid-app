import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:sdf_covid/data/meta.dart';

void main() {
  test('Sample json should be parsed correctly', () async {
    final file = File('test/data/meta.json');
    final json = jsonDecode(await file.readAsString());
    final meta = MetaDataElement.fromJson(json);

    expect(meta.source, 'Robert Koch-Institut');
    expect(meta.contact, 'Marlon Lueckert (m.lueckert@me.com)');
    expect(meta.info, 'https://github.com/marlon360/rki-covid-api');

    expect(meta.lastUpdate, DateTime.utc(2021, 1, 3));
    expect(meta.lastCheckedForUpdate, DateTime.utc(2021, 1, 4, 13, 20, 30, 694));
  });
}
