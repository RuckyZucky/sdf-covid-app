import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sdf_covid/bloc/home_page/home_page_event.dart';
import 'package:sdf_covid/bloc/home_page/home_page_state.dart';
import 'package:sdf_covid/data/rki_data.dart';
import 'package:sdf_covid/repositories/germany.dart';

class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {
  HomePageBloc() : super(HomePageUninitialized()) {
    on<LoadHomePageData>((event, emit) async {
      emit(HomePageLoading());
      Data? cases;
      try {
        cases = (await GermanyRepository.getCases(1)).first;
      } catch(e) {
        print(e);
      }
      Data? deaths;
      try {
        deaths = (await GermanyRepository.getDeaths(1)).first;
      } catch(e) {
        print(e);
      }
      Data? hospitalization;
      try {
        hospitalization = (await GermanyRepository.getHospitalizations(1)).first;
      } catch(e) {
        print(e);
      }
      Data? incidence;
      try {
        incidence = (await GermanyRepository.getIncidence(1)).first;
      } catch(e) {
        print(e);
      }

      emit(HomePageLoaded(cases, deaths, hospitalization, incidence));
    });
  }

}
