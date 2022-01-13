import 'package:sdf_covid/data/rki_data.dart';

abstract class CasesState {}

class CasesUninitialized extends CasesState {}

class CasesLoading extends CasesState {}

class CasesLoaded extends CasesState {
  final List<Data> casesData;

  CasesLoaded(this.casesData);
}
