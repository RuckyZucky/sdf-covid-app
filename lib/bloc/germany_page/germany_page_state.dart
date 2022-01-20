import 'package:sdf_covid/data/rki_data.dart';

abstract class GermanyPageState {}

class GermanyPageUninitialized extends GermanyPageState {}

class GermanyPageLoading extends GermanyPageState {}

class GermanyPageLoaded extends GermanyPageState {
  final List<Data>? cases;
  final List<Data>? deaths;
  final List<Data>? hospitalization;

  GermanyPageLoaded(this.cases, this.deaths, this.hospitalization);
}
