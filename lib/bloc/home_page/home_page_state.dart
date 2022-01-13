import 'package:sdf_covid/data/cases.dart';
import 'package:sdf_covid/data/deaths.dart';
import 'package:sdf_covid/data/hospitalizations.dart';

abstract class HomePageState {}

class HomePageUninitialized extends HomePageState {}

class HomePageLoading extends HomePageState {}

class HomePageLoaded extends HomePageState {
  final CaseDay? cases;
  final DeathDay? deaths;
  final HospitalizationDay? hospitalization;

  HomePageLoaded(this.cases, this.deaths, this.hospitalization);
}
