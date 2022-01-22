import 'dart:convert';

import 'package:http/http.dart';
import 'package:sdf_covid/data/incidence/incidence_calculator.dart';
import 'package:sdf_covid/data/incidence/population.dart';
import 'package:sdf_covid/data/rki_data.dart';

class GermanyRepository {
  static final Client _client = Client();

  GermanyRepository._internal();

  static Future<List<Data>> getCases([int? days]) async {
    String daysString = days == null ? '' : '/$days';

    final result = await _client.get(Uri.parse('https://api.corona-zahlen.org/germany/history/cases$daysString'));

    if (result.statusCode == 200) {
      return DataContainer.fromJsonGermany(jsonDecode(result.body), Data.casesFromJson).data;
    } else {
      throw Exception('getCases returned with status code ${result.statusCode}\n${result.body}');
    }
  }

  static Future<List<Data>> getDeaths([int? days]) async {
    String daysString = days == null ? '' : '/$days';

    final result = await _client.get(Uri.parse('https://api.corona-zahlen.org/germany/history/deaths$daysString'));

    if (result.statusCode == 200) {
      return DataContainer.fromJsonGermany(jsonDecode(result.body), Data.deathsFromJson).data;
    } else {
      throw Exception('getDeaths returned with status code ${result.statusCode}\n${result.body}');
    }
  }

  static Future<List<Data>> getHospitalizations([int? days]) async {
    String daysString = days == null ? '' : '/$days';

    final result = await _client.get(Uri.parse('https://api.corona-zahlen.org/germany/history/hospitalization$daysString'));

    if (result.statusCode == 200) {
      return DataContainer.fromJsonGermany(jsonDecode(result.body), Data.hospitalizationsFromJson).data;
    } else {
      throw Exception('getHospitalizations returned with status code ${result.statusCode}\n${result.body}');
    }
  }

  static Future<List<Data>> getIncidence([int? days]) async {
    String daysString = days == null ? '' : '/$days';

    final result = await _client.get(Uri.parse('https://api.corona-zahlen.org/germany/history/cases$daysString'));

    if (result.statusCode == 200) {
      final data = DataContainer.fromJsonGermany(jsonDecode(result.body), Data.casesFromJson).data;
      return IncidenceCalculator(data, population["GER"]!.toInt()).calculate();
    } else {
      throw Exception('getCases returned with status code ${result.statusCode}\n${result.body}');
    }
  }

}
