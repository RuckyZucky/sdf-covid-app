import '../rki_data.dart';

List<Data> calculateIncidence(List<Data> cases, int population) {
  if (cases.length < 7) {
    throw Exception(
        "Can't calculate incidence when less than 7 days of data are provided");
  }

  List<Data> result = [];

  for (int i = 7; i <= cases.length; i++) {
    int incidence = 0;

    for (int j = i - 7; j < i; j++) {
      incidence += cases[j].count;
    }

    incidence = (incidence / population * 100000).ceil();

    result.add(Data(incidence, cases[i - 1].date));
  }

  return result;
}
