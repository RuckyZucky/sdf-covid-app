import '../rki_data.dart';

class IncidenceCalculator {
  final List<Data> cases;
  final int population;

  IncidenceCalculator(this.cases, this.population);

  List<Data> calculate() {
    throw UnimplementedError("TODO");
  }
}