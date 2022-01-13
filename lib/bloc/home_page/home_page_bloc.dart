import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sdf_covid/bloc/home_page/home_page_event.dart';
import 'package:sdf_covid/bloc/home_page/home_page_state.dart';
import 'package:sdf_covid/data/cases.dart';
import 'package:sdf_covid/data/deaths.dart';
import 'package:sdf_covid/data/hospitalizations.dart';
import 'package:sdf_covid/repositories/germany.dart';

class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {
  HomePageBloc() : super(HomePageUninitialized()) {
    on<LoadHomePageData>((event, emit) async {
      emit(HomePageLoading());
      CaseDay? cases;
      try {
        cases = (await GermanyRepository.getCases(1)).data.first;
      } catch(e) {
        print(e);
      }
      DeathDay? deaths;
      try {
        deaths = (await GermanyRepository.getDeaths(1)).data.first;
      } catch(e) {
        print(e);
      }
      HospitalizationDay? hospitalization;
      try {
        hospitalization = (await GermanyRepository.getHospitalizations(1)).data.first;
      } catch(e) {
        print(e);
      }

      emit(HomePageLoaded(cases, deaths, hospitalization));
    });
  }

}
