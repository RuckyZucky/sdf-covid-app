import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sdf_covid/bloc/federal_state/fedstate_page_event.dart';
import 'package:sdf_covid/bloc/federal_state/fedstate_page_state.dart';
import 'package:sdf_covid/data/rki_data.dart';
import 'package:sdf_covid/data/states.dart';
import 'package:sdf_covid/pages/germany/timeframe.dart';
import 'package:sdf_covid/repositories/states.dart';

class FedStatePageBloc extends Bloc<FedStatePageEvent, FedstatePageState> {
  FedStatePageBloc() : super(FedstatePageUninitialized()) {
    on<LoadFedStatePageData>((event, emit) async {
      emit(FedstatePageLoading());

FederalState state;
state = FederalState.BE;
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
        cases = (await StatesRepository.getCases(state,days));
      } catch(e) {
        print(e);
      }
      List<Data>? deaths;
      try {
        deaths = (await StatesRepository.getDeaths(state,days));
      } catch(e) {
        print(e);
      }
      List<Data>? hospitalization;
      try {
        hospitalization = (await StatesRepository.getHospitalizations(state,days));
      } catch(e) {
        print(e);
      }

      emit(FedstatePageLoaded(cases, deaths, hospitalization));
    });
  }

}
