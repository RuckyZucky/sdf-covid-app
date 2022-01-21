import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sdf_covid/bloc/germany_page/germany_page_bloc.dart';
import 'package:sdf_covid/bloc/germany_page/germany_page_event.dart';

import '../../timeframe.dart';

class DateFilter extends StatelessWidget implements PreferredSizeWidget {
  const DateFilter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TabBar(
      onTap: (index) {
        TimeFrame? timeFrame;
        switch(index) {
          case 0:
            timeFrame = TimeFrame.DAYS;
            break;
          case 1:
            timeFrame = TimeFrame.MONTH;
            break;
          case 2:
            timeFrame = TimeFrame.YEAR;
            break;
        }
        context.read<GermanyPageBloc>().add(LoadGermanyPageData(timeframe: timeFrame));
      },
      tabs: const [
        Tab(
          text: 'Woche',
        ),
        Tab(
          text: 'Monat',
        ),
        Tab(
          text: 'Jahr',
        ),
        Tab(
          text: 'Gesamt',
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size(double.infinity, 52.0);
}