import 'meta.dart';
import 'deaths.dart';
import 'states.dart';

class StateDeathsData {
  final State data;

  final MetaDataElement meta;

  StateDeathsData(this.data, this.meta);

  StateDeathsData.fromJson(FederalState state, Map<String, dynamic> json) :
        meta = MetaDataElement.fromJson(json['meta']),
        data = State.fromJson(json['data'][state.name]);

  DeathsData toDeathsData() {
    return DeathsData(data.history, meta);
  }
}

class State {
  final int id;

  final String name;

  final List<DeathDay> history;

  State(this.id, this.name, this.history);

  State.fromJson(Map<String, dynamic> json) :
        id = json['id'],
        name = json['name'],
        history = (json['history'] as List).map((e) => DeathDay.fromJson(e)).toList();
}