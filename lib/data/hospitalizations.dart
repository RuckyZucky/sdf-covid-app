import 'meta.dart';

class HospitalizationsData {
  final List<HospitalizationDay> data;

  final MetaDataElement meta;

  HospitalizationsData(this.data, this.meta);

  HospitalizationsData.fromJson(Map<String, dynamic> json) :
        meta = MetaDataElement.fromJson(json['meta']),
        data = (json['data'] as List).map((e) => HospitalizationDay.fromJson(e)).toList();
}

class HospitalizationDay {
  final int hospitalizations;

  final DateTime date;

  HospitalizationDay(this.hospitalizations, this.date);

  HospitalizationDay.fromJson(Map<String, dynamic> json) :
        hospitalizations = json['cases7Days'],
        date = DateTime.parse(json['date']);
}
