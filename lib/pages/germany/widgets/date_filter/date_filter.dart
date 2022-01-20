import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sdf_covid/bloc/germany_page/germany_page_bloc.dart';
import 'package:sdf_covid/bloc/germany_page/germany_page_event.dart';
import 'package:sdf_covid/pages/germany/widgets/date_filter/date_filter_button.dart';

import 'package:sdf_covid/data/timeframe.dart';

class DateFilter extends StatelessWidget {
  const DateFilter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(children: <Widget>[
      DateFilterButton(() {
        context.read<GermanyPageBloc>().add(LoadGermanyPageData(timeframe: TimeFrame.days));
      }, "Woche"),
      DateFilterButton(() {
        context.read<GermanyPageBloc>().add(LoadGermanyPageData(timeframe: TimeFrame.month));
      }, "Monat"),
      DateFilterButton(() {
        context.read<GermanyPageBloc>().add(LoadGermanyPageData(timeframe: TimeFrame.year));
      }, "Jahr"),
      DateFilterButton(() {
        context.read<GermanyPageBloc>().add(LoadGermanyPageData());
      }, "Gesamt")
    ]);
  }
}
