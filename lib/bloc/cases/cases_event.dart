abstract class CasesEvent {}

class LoadCases extends CasesEvent {
  final int? days;

  LoadCases([this.days]);
}
