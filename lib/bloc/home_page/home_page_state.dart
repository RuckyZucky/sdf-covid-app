import 'package:sdf_covid/data/rki_data.dart';

abstract class HomePageState {}

class HomePageUninitialized extends HomePageState {}

class HomePageLoading extends HomePageState {}

class HomePageLoaded extends HomePageState {
  final Data? cases;
  final Data? deaths;
  final Data? hospitalization;
  final Data? incidence;

  HomePageLoaded(this.cases, this.deaths, this.hospitalization, this.incidence);
}
