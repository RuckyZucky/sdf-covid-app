import 'dart:convert';

import 'package:http/http.dart';
import 'package:sdf_covid/data/states.dart';
import 'package:sdf_covid/data/cases.dart';
import 'package:sdf_covid/data/deaths.dart';
import 'package:sdf_covid/data/hospitalizations.dart';
import 'package:sdf_covid/data/state_cases.dart';
import 'package:sdf_covid/data/state_deaths.dart';
import 'package:sdf_covid/data/state_hospitalizations.dart';

class StatesRepository {
  static final Client _client = Client();

  StatesRepository._internal();

  static Future<CasesData> getCases(FederalState state, [int? days]) async {
    String daysString = days == null ? '' : '/$days';
    String stateString = state.name;

    final result = await _client.get(Uri.parse('https://api.corona-zahlen.org/states/$stateString/history/cases$daysString'));

    if (result.statusCode == 200) {
      return StateCasesData.fromJson(state, jsonDecode(result.body)).toCasesData();
    } else {
      throw Exception('getCases returned with status code ${result.statusCode}\n${result.body}');
    }
  }

  static Future<DeathsData> getDeaths(FederalState state, [int? days]) async {
    String daysString = days == null ? '' : '/$days';
    String stateString = state.name;

    final result = await _client.get(Uri.parse('https://api.corona-zahlen.org/states/$stateString/history/deaths$daysString'));

    if (result.statusCode == 200) {
      return StateDeathsData.fromJson(state, jsonDecode(result.body)).toDeathsData();
    } else {
      throw Exception('getDeaths returned with status code ${result.statusCode}\n${result.body}');
    }
  }

  static Future<HospitalizationsData> getHospitalizations(FederalState state, [int? days]) async {
    String daysString = days == null ? '' : '/$days';
    String stateString = state.name;

    final result = await _client.get(Uri.parse('https://api.corona-zahlen.org/states/$stateString/history/hospitalization$daysString'));

    if (result.statusCode == 200) {
      return StateHospitalizationsData.fromJson(state, jsonDecode(result.body)).toHospitalizationsData();
    } else {
      throw Exception('getDeaths returned with status code ${result.statusCode}\n${result.body}');
    }
  }
}