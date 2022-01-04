import 'dart:convert';

import 'package:http/http.dart';
import 'package:sdf_covid/data/cases.dart';
import 'package:sdf_covid/data/deaths.dart';
import 'package:sdf_covid/data/hospitalizations.dart';

class GermanyRepository {
  static final Client _client = Client();

  GermanyRepository._internal();

  static Future<CasesData> getCases([int? days]) async {
    String daysString = days == null ? '' : '/$days';
    final result = await _client.get(Uri.parse('https://api.corona-zahlen.org/germany/history/cases$daysString'));
    if (result.statusCode == 200) {
      return CasesData.fromJson(jsonDecode(result.body));
    } else {
      throw Exception('getCases returned with status code ${result.statusCode}\n${result.body}');
    }
  }

  static Future<DeathsData> getDeaths([int? days]) async {
    throw UnimplementedError("TODO: Implement getDeaths method");
  }

  static Future<HospitalizationsData> getHospitalizations([int? days]) async {
    throw UnimplementedError("TODO: Implement getHospitalizations method");
  }

}
