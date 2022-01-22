import 'package:flutter_test/flutter_test.dart';
import 'package:sdf_covid/repositories/germany.dart';

void main() {
  test('getCases without specified days should return 200', () async {
    final cases = await GermanyRepository.getCases();

    expect(cases.length, isNot(0));
  });

  test('getCases with specified days should return 200', () async {
    final cases = await GermanyRepository.getCases(10);
    
    expect(cases.length, 10);
  });

  test('getDeaths without specified days should return 200', () async {
    final deaths = await GermanyRepository.getDeaths();

    expect(deaths.length, isNot(0));
  });

  test('getCases with specified days should return 200', () async {
    final deaths = await GermanyRepository.getDeaths(10);

    expect(deaths.length, 10);
  });

  test('getHospitalizations without specified days should return 200', () async {
    final hospitalizations = await GermanyRepository.getHospitalizations();

    expect(hospitalizations.length, isNot(0));
  });

  test('getHospitalizations with specified days should return 200', () async {
    final hospitalizations = await GermanyRepository.getHospitalizations(10);

    expect(hospitalizations.length, 10);
  });

  test('getIncidence without specified days should return 200', () async {
    final incidence = await GermanyRepository.getIncidence();

    expect(incidence.length, isNot(0));
  });

  test('getIncidence for 7 days should return one value', () async {
    final incidence = await GermanyRepository.getIncidence(7);

    expect(incidence.length, 1);
  });

  test('getIncidence for 14 days should return 8 value', () async {
    final incidence = await GermanyRepository.getIncidence(14);

    expect(incidence.length, 8);
  });
}
