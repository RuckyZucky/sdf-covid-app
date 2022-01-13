import 'package:sdf_covid/data/states.dart';

import 'meta.dart';

class DataContainer {
  final List<Data> data;

  final MetaDataElement meta;

  DataContainer(this.data, this.meta);

  DataContainer.fromJsonGermany(Map<String, dynamic> json, Data Function(Map<String, dynamic> json) fromJson) :
        meta = MetaDataElement.fromJson(json['meta']),
        data = (json['data'] as List).map((e) => fromJson(e)).toList();

  DataContainer.fromJsonState(Map<String, dynamic> json, Data Function(Map<String, dynamic> json) fromJson, FederalState state) :
        meta = MetaDataElement.fromJson(json['meta']),
        data = (json['data'][state.name]['history'] as List).map((e) => fromJson(e)).toList();
}

class Data {
  final int count;
  final DateTime date;

  Data(this.count, this.date);

  Data.casesFromJson(Map<String, dynamic> json) :
      count = json['cases'],
      date = DateTime.parse(json['date']);

  Data.deathsFromJson(Map<String, dynamic> json) :
        count = json['deaths'],
        date = DateTime.parse(json['date']);

  Data.hospitalizationsFromJson(Map<String, dynamic> json) :
        count = json['cases7Days'],
        date = DateTime.parse(json['date']);
}