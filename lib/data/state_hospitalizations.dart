import 'meta.dart';
import 'hospitalizations.dart';
import 'states.dart';

class StateHospitalizationsData {
  final State data;

  final MetaDataElement meta;

  StateHospitalizationsData(this.data, this.meta);

  StateHospitalizationsData.fromJson(FederalState state, Map<String, dynamic> json) :
        meta = MetaDataElement.fromJson(json['meta']),
        data = State.fromJson(json['data'][state.name]);

  HospitalizationsData toHospitalizationsData() {
    return HospitalizationsData(data.history, meta);
  }
}

class State {
  final int id;

  final String name;

  final List<HospitalizationDay> history;

  State(this.id, this.name, this.history);

  State.fromJson(Map<String, dynamic> json) :
        id = json['id'],
        name = json['name'],
        history = (json['history'] as List).map((e) => HospitalizationDay.fromJson(e)).toList();
}