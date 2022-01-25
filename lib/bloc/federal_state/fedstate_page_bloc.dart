import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sdf_covid/bloc/federal_state/fedstate_page_event.dart';
import 'package:sdf_covid/bloc/federal_state/fedstate_page_state.dart';
import 'package:sdf_covid/data/rki_data.dart';
import 'package:sdf_covid/data/states.dart';
import 'package:sdf_covid/data/timeframe.dart';
import 'package:sdf_covid/repositories/states.dart';

class FedStatePageBloc extends Bloc<FedStatePageEvent, FedstatePageState> {

  TimeFrame _currentTimeframe = TimeFrame.all;
  FederalState _currentFederalState = FederalState.BE;

  FedStatePageBloc() : super(FedstatePageUninitialized()) {
    on<LoadFedStatePageData>((event, emit) async {
      emit(FedstatePageLoading());


      FederalState state = (event.federalState ?? _currentFederalState);
      TimeFrame timeFrame = event.timeframe ?? _currentTimeframe;
      int? days;

      switch (timeFrame) {
        case (TimeFrame.days):
          days = 7;
          break;
        case (TimeFrame.month):
          days = 30;
          break;
        case (TimeFrame.year):
          days = 365;
          break;
        case (TimeFrame.all):
          days = null;
          break;
      }

      List<Data>? cases;
      try {
        cases = (await StatesRepository.getCases(state, days));
      } catch(e) {
        print(e);
      }
      List<Data>? deaths;
      try {
        deaths = (await StatesRepository.getDeaths(state, days));
      } catch(e) {
        print(e);
      }
      List<Data>? hospitalization;
      try {
        hospitalization = (await StatesRepository.getHospitalizations(state, days));
      } catch(e) {
        print(e);
      }
      List<Data>? incidence;
      try {
        incidence = (await StatesRepository.getIncidence(state, days));
      } catch(e) {
        print(e);
      }

      _currentFederalState = state;
      _currentTimeframe = timeFrame;

      emit(FedstatePageLoaded(cases, deaths, hospitalization, incidence));
    });
  }

}
