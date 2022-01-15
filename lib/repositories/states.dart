import 'dart:convert';

import 'package:http/http.dart';
import 'package:sdf_covid/data/rki_data.dart';
import 'package:sdf_covid/data/states.dart';

class StatesRepository {
  static final Client _client = Client();

  StatesRepository._internal();

  static Future<List<Data>> getCases(FederalState state, [int? days]) async {
    String daysString = days == null ? '' : '/$days';
    String stateString = state.name;

    final result = await _client.get(Uri.parse('https://api.corona-zahlen.org/states/$stateString/history/cases$daysString'));

    if (result.statusCode == 200) {
      return DataContainer.fromJsonState(jsonDecode(result.body), Data.casesFromJson, state).data;
    } else {
      throw Exception('getCases returned with status code ${result.statusCode}\n${result.body}');
    }
  }

  static Future<List<Data>> getDeaths(FederalState state, [int? days]) async {
    String daysString = days == null ? '' : '/$days';
    String stateString = state.name;

    final result = await _client.get(Uri.parse('https://api.corona-zahlen.org/states/$stateString/history/deaths$daysString'));

    if (result.statusCode == 200) {
      return DataContainer.fromJsonState(jsonDecode(result.body), Data.deathsFromJson, state).data;
    } else {
      throw Exception('getDeaths returned with status code ${result.statusCode}\n${result.body}');
    }
  }

  static Future<List<Data>> getHospitalizations(FederalState state, [int? days]) async {
    String daysString = days == null ? '' : '/$days';
    String stateString = state.name;

    final result = await _client.get(Uri.parse('https://api.corona-zahlen.org/states/$stateString/history/hospitalization$daysString'));

    if (result.statusCode == 200) {
      return DataContainer.fromJsonState(jsonDecode(result.body), Data.hospitalizationsFromJson, state).data;
    } else {
      throw Exception('getDeaths returned with status code ${result.statusCode}\n${result.body}');
    }
  }
}