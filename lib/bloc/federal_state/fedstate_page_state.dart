import 'package:sdf_covid/data/rki_data.dart';

abstract class FedstatePageState {}

class FedstatePageUninitialized extends FedstatePageState {}

class FedstatePageLoading extends FedstatePageState {}

class FedstatePageLoaded extends FedstatePageState {
  final List<Data>? cases;
  final List<Data>? deaths;
  final List<Data>? hospitalization;
  final List<Data>? incidence;

  FedstatePageLoaded(this.cases, this.deaths, this.hospitalization, this.incidence);
}
