import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sdf_covid/bloc/germany_page/germany_page_event.dart';
import 'package:sdf_covid/bloc/germany_page/germany_page_state.dart';
import 'package:sdf_covid/data/rki_data.dart';
import 'package:sdf_covid/repositories/germany.dart';

class GermanyPageBloc extends Bloc<GermanyPageEvent, GermanyPageState> {
  GermanyPageBloc() : super(GermanyPageUninitialized()) {
    on<LoadGermanyPageData>((event, emit) async {
      emit(GermanyPageLoading());
      List<Data>? cases;
      try {
        cases = (await GermanyRepository.getCases(30));
      } catch(e) {
        print(e);
      }
      List<Data>? deaths;
      try {
        deaths = (await GermanyRepository.getDeaths(30));
      } catch(e) {
        print(e);
      }
      List<Data>? hospitalization;
      try {
        hospitalization = (await GermanyRepository.getHospitalizations(30));
      } catch(e) {
        print(e);
      }

      emit(GermanyPageLoaded(cases, deaths, hospitalization));
    });
  }

}
