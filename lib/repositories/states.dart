import 'dart:convert';

import 'package:http/http.dart';
import 'package:sdf_covid/data/states.dart';
import 'package:sdf_covid/data/cases.dart';
import 'package:sdf_covid/data/state_cases.dart';
import 'package:sdf_covid/data/deaths.dart';
import 'package:sdf_covid/data/hospitalizations.dart';

class StatesRepository {
  static final Client _client = Client();

  StatesRepository._internal();

  static Future<CasesData> getCases(FederalState state, [int? days]) async {
    String daysString = days == null ? '' : '/$days';

    final result = await _client.get(Uri.parse('https://api.corona-zahlen.org/states/$state./history/cases$daysString'));

    if (result.statusCode == 200) {
      return StateCasesData.fromJson(state, jsonDecode(result.body)).toCasesData();
    } else {
      throw Exception('getCases returned with status code ${result.statusCode}\n${result.body}');
    }
  }

  static Future<DeathsData> getDeaths(FederalState state, [int? days]) async {
    throw UnimplementedError("TODO: Implement getDeaths method");
  }

  static Future<HospitalizationsData> getHospitalizations(FederalState state, [int? days]) async {
    throw UnimplementedError("TODO: Implement getHospitalizations method");
  }
}