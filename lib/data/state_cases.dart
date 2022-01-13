import 'meta.dart';
import 'cases.dart';
import 'states.dart';

class StateCasesData {
  final State data;

  final MetaDataElement meta;

  StateCasesData(this.data, this.meta);

  StateCasesData.fromJson(FederalState state, Map<String, dynamic> json) :
        meta = MetaDataElement.fromJson(json['meta']),
        data = State.fromJson(json['data'][state.name]);

  CasesData toCasesData() {
    return CasesData(data.history, meta);
  }
}

class State {
  final int id;

  final String name;

  final List<CaseDay> history;

  State(this.id, this.name, this.history);

  State.fromJson(Map<String, dynamic> json) :
        id = json['id'],
        name = json['name'],
        history = (json['history'] as List).map((e) => CaseDay.fromJson(e)).toList();
}