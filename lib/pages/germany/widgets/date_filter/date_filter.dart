import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sdf_covid/bloc/germany_page/germany_page_bloc.dart';
import 'package:sdf_covid/bloc/germany_page/germany_page_event.dart';
import 'package:sdf_covid/bloc/germany_page/germany_page_state.dart';
import 'package:sdf_covid/pages/germany/widgets/date_filter/date_filter_button.dart';

import '../../timeframe.dart';

class DateFilter extends StatelessWidget {
  const DateFilter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GermanyPageBloc, GermanyPageState>(
      builder: (context, state) {
        return Row(
            children: <Widget>[
              DateFilterButton(() {
                context.read<GermanyPageBloc>().add(LoadGermanyPageData(timeframe: TimeFrame.DAYS));
              }, "Woche"),
              DateFilterButton(() {
                context.read<GermanyPageBloc>().add(LoadGermanyPageData(timeframe: TimeFrame.MONTH));
              }, "Monat"),
              DateFilterButton(() {
                context.read<GermanyPageBloc>().add(LoadGermanyPageData(timeframe: TimeFrame.YEAR));
              }, "Jahr"),
              DateFilterButton(() {
                context.read<GermanyPageBloc>().add(LoadGermanyPageData());
              }, "Gesamt")
            ]
        );
      }
    );
  }
}