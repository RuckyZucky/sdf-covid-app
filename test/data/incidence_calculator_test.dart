import 'package:flutter_test/flutter_test.dart';
import 'package:sdf_covid/data/incidence/incidence_calculator.dart';
import 'package:sdf_covid/data/rki_data.dart';

void main() {
  test('IncidenceCalculator throws error when less than 7 days of data are supplied', () async {
    final List<Data> cases = [
      Data(1, DateTime(2020, 8, 8)),
      Data(2, DateTime(2020, 8, 9)),
      Data(3, DateTime(2020, 8, 10)),
      Data(4, DateTime(2020, 8, 11)),
      Data(5, DateTime(2020, 8, 12)),
      Data(6, DateTime(2020, 8, 13)),
    ];

    expect(() => IncidenceCalculator(cases, 100000).calculate(), throwsException);
  });

  test('IncidenceCalculator correctly calculates incidence for 7 provided days', () async {
    final List<Data> cases = [
      Data(1, DateTime(2020, 8, 8)),
      Data(2, DateTime(2020, 8, 9)),
      Data(3, DateTime(2020, 8, 10)),
      Data(4, DateTime(2020, 8, 11)),
      Data(5, DateTime(2020, 8, 12)),
      Data(6, DateTime(2020, 8, 13)),
      Data(7, DateTime(2020, 8, 14))
    ];

    final incidence = IncidenceCalculator(cases, 100000).calculate();

    expect(incidence.length, 1);
    expect(incidence[0].count, 28);
    expect(incidence[0].date, DateTime(2020, 8, 14)); // I'm not sure if this will work
  });

  test('IncidenceCalculator correctly calculates incidence for 14 provided days', () async {
    final List<Data> cases = [
      Data(1, DateTime(2020, 8, 1)),
      Data(1, DateTime(2020, 8, 2)),
      Data(1, DateTime(2020, 8, 3)),
      Data(1, DateTime(2020, 8, 4)),
      Data(1, DateTime(2020, 8, 5)),
      Data(1, DateTime(2020, 8, 6)),
      Data(1, DateTime(2020, 8, 7)),
      Data(1, DateTime(2020, 8, 8)),
      Data(2, DateTime(2020, 8, 9)),
      Data(3, DateTime(2020, 8, 10)),
      Data(4, DateTime(2020, 8, 11)),
      Data(5, DateTime(2020, 8, 12)),
      Data(6, DateTime(2020, 8, 13)),
      Data(7, DateTime(2020, 8, 14))
    ];

    final incidence = IncidenceCalculator(cases, 100000).calculate();

    expect(incidence.length, 14);
    expect(incidence.last.count, 28);
    expect(incidence.last.date, DateTime(2020, 8, 14)); // I'm not sure if this will work
  });
}
