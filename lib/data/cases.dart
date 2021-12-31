import 'meta.dart';

class CasesData {
  final List<CaseDay> data;

  final MetaDataElement meta;

  CasesData(this.data, this.meta);

  CasesData.fromJson(Map<String, dynamic> json) :
      meta = MetaDataElement.fromJson(json['meta']),
      data = (json['data'] as List).map((e) => CaseDay.fromJson(e)).toList();
}

class CaseDay {
  final int cases;

  final DateTime date;

  CaseDay(this.cases, this.date);

  CaseDay.fromJson(Map<String, dynamic> json) :
      cases = json['cases'],
      date = DateTime.parse(json['date']);
}
