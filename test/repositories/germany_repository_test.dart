
import 'package:flutter_test/flutter_test.dart';
import 'package:sdf_covid/repositories/germany.dart';

void main() {
  test('getCases without specified days should return 200', () async {
    final cases = await GermanyRepository.getCases();

    expect(cases.data.length, isNot(0));
  });

  test('getCases with specified days should return 200', () async {
    final cases = await GermanyRepository.getCases(10);
    
    expect(cases.data.length, 10);
  });

  test('getDeaths without specified days should return 200', () async {
    final deaths = await GermanyRepository.getDeaths();

    expect(deaths.data.length, isNot(0));
  });

  test('getCases with specified days should return 200', () async {
    final deaths = await GermanyRepository.getDeaths(10);

    expect(deaths.data.length, 10);
  });

  test('getHospitalizations without specified days should return 200', () async {
    final hospitalizations = await GermanyRepository.getHospitalizations();

    expect(hospitalizations.data.length, isNot(0));
  });

  test('getHospitalizations with specified days should return 200', () async {
    final hospitalizations = await GermanyRepository.getHospitalizations(10);

    expect(hospitalizations.data.length, 10);
  });
}
