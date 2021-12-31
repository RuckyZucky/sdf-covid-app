import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sdf_covid/bloc/cases/cases_event.dart';
import 'package:sdf_covid/bloc/cases/cases_state.dart';
import 'package:sdf_covid/repositories/germany.dart';

class CasesBloc extends Bloc<CasesEvent, CasesState> {
  CasesBloc() : super(CasesUninitialized()) {
    on<LoadCases>((event, emit) async {
      emit(CasesLoading());
      final cases = await GermanyRepository.getCases(event.days);
      emit(CasesLoaded(cases));
    });
  }
}
