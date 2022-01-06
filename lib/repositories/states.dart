import 'package:sdf_covid/data/states.dart';
import 'package:sdf_covid/data/cases.dart';
import 'package:sdf_covid/data/deaths.dart';
import 'package:sdf_covid/data/hospitalizations.dart';

class StatesRepository {
  static Future<CasesData> getCases(FederalState state, [int? days]) async {
    throw UnimplementedError("TODO: Implement getCases method");
  }

  static Future<DeathsData> getDeaths(FederalState state, [int? days]) async {
    throw UnimplementedError("TODO: Implement getDeaths method");
  }

  static Future<HospitalizationsData> getHospitalizations(FederalState state, [int? days]) async {
    throw UnimplementedError("TODO: Implement getHospitalizations method");
  }
}