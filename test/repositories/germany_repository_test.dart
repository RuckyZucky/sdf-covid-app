
import 'package:flutter_test/flutter_test.dart';
import 'package:sdf_covid/repositories/germany.dart';

void main() {
  test('getCases without specified date should return 200', () async {
    final cases = await GermanyRepository.getCases();

    expect(cases.data.length, isNot(0));
  });

  test('getCases with specified date should return 200', () async {
    final cases = await GermanyRepository.getCases(10);
    
    expect(cases.data.length, 10);
  });
}
