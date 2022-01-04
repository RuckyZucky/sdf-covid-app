import 'package:flutter_test/flutter_test.dart';
import 'package:sdf_covid/repositories/states.dart';
import 'package:sdf_covid/data/states.dart';

void main() {
  test('getCases for SH without specified days should return 200', () async {
    final cases = await StatesRepository.getCases(FederalState.SH);

    expect(cases.data.length, isNot(0));
  });

  test('getCases for SH with specified days should return 200 and correct count of days', () async {
    final cases = await StatesRepository.getCases(FederalState.SH, 10);

    expect(cases.data.length, 10);
  });

  test('getDeaths for SH without specified days should return 200', () async {
    final deaths = await StatesRepository.getDeaths(FederalState.SH);

    expect(deaths.data.length, isNot(0));
  });

  test('getDeaths for SH with specified days should return 200 and correct count of days', () async {
    final deaths = await StatesRepository.getDeaths(FederalState.SH, 10);

    expect(deaths.data.length, 10);
  });

  test('getHospitalizations for SH without specified days should return 200', () async {
    final hospitalizations = await StatesRepository.getHospitalizations(FederalState.SH);

    expect(hospitalizations.data.length, isNot(0));
  });

  test('getHospitalizations for SH with specified days should return 200 and correct count of days', () async {
    final hospitalizations = await StatesRepository.getHospitalizations(FederalState.SH, 10);

    expect(hospitalizations.data.length, 10);
  });
}