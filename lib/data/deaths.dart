import 'meta.dart';

class DeathsData {
  final List<DeathDay> data;

  final MetaDataElement meta;

  DeathsData(this.data, this.meta);

  DeathsData.fromJson(Map<String, dynamic> json) :
        meta = MetaDataElement.fromJson(json['meta']),
        data = (json['data'] as List).map((e) => DeathDay.fromJson(e)).toList();
}

class DeathDay {
  final int deaths;

  final DateTime date;

  DeathDay(this.deaths, this.date);

  DeathDay.fromJson(Map<String, dynamic> json) :
        deaths = json['deaths'],
        date = DateTime.parse(json['date']);
}
