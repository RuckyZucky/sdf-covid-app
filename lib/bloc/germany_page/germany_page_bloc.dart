import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sdf_covid/bloc/germany_page/germany_page_event.dart';
import 'package:sdf_covid/bloc/germany_page/germany_page_state.dart';
import 'package:sdf_covid/data/rki_data.dart';
import 'package:sdf_covid/pages/germany/timeframe.dart';
import 'package:sdf_covid/repositories/germany.dart';

class GermanyPageBloc extends Bloc<GermanyPageEvent, GermanyPageState> {
  GermanyPageBloc() : super(GermanyPageUninitialized()) {
    on<LoadGermanyPageData>((event, emit) async {
      emit(GermanyPageLoading());


      int? days;

      switch (event.timeframe) {
        case (TimeFrame.DAYS):
          days = 7;
          break;
        case (TimeFrame.MONTH):
          days = 30;
          break;
        case (TimeFrame.YEAR):
          days = 365;
          break;
      }

      List<Data>? cases;
      try {
        cases = (await GermanyRepository.getCases(days));
      } catch(e) {
        print(e);
      }
      List<Data>? deaths;
      try {
        deaths = (await GermanyRepository.getDeaths(days));
      } catch(e) {
        print(e);
      }
      List<Data>? hospitalization;
      try {
        hospitalization = (await GermanyRepository.getHospitalizations(days));
      } catch(e) {
        print(e);
      }

      emit(GermanyPageLoaded(cases, deaths, hospitalization));
    });
  }

}
