import 'package:sdf_covid/data/cases.dart';

abstract class CasesState {}

class CasesUninitialized extends CasesState {}

class CasesLoading extends CasesState {}

class CasesLoaded extends CasesState {
  final CasesData casesData;

  CasesLoaded(this.casesData);
}
