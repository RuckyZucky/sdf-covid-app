import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sdf_covid/bloc/federal_state/fedstate_page_bloc.dart' ;
import 'package:sdf_covid/bloc/federal_state/fedstate_page_event.dart' ;
import 'package:sdf_covid/bloc/federal_state/fedstate_page_state.dart';
import 'package:sdf_covid/data/states.dart';
import 'package:sdf_covid/pages/federalstates/widgets/date_filter/date_filter_button.dart';
import 'package:sdf_covid/pages/germany/timeframe.dart';



class DateFilter extends StatelessWidget {
  const DateFilter({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FedStatePageBloc, FedstatePageState>(
      builder: (context, state) {
        return Row(
            children: <Widget>[
              DateFilterButton(() {
                context.read<FedStatePageBloc>().add(LoadFedStatePageData(timeframe: TimeFrame.DAYS));
              }, "Woche"),
              DateFilterButton(() {
                context.read<FedStatePageBloc>().add(LoadFedStatePageData(timeframe: TimeFrame.MONTH));
              }, "Monat"),
              DateFilterButton(() {
                context.read<FedStatePageBloc>().add(LoadFedStatePageData(timeframe: TimeFrame.YEAR));
              }, "Jahr"),
              DateFilterButton(() {
                context.read<FedStatePageBloc>().add(LoadFedStatePageData());
              }, "Gesamt")
            ]
        );
      }
    );
  }
}