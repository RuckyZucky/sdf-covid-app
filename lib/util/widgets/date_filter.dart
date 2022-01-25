import 'package:flutter/material.dart';
import 'package:sdf_covid/data/timeframe.dart';

class DateFilter extends StatelessWidget implements PreferredSizeWidget {

  final Function(TimeFrame timeFrame, BuildContext context)? onTap;

  const DateFilter({Key? key, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TabBar(
      onTap: (index) {
        TimeFrame timeFrame;
        switch(index) {
          case 0:
            timeFrame = TimeFrame.days;
            break;
          case 1:
            timeFrame = TimeFrame.month;
            break;
          case 2:
            timeFrame = TimeFrame.year;
            break;
          case 3:
          default:
            timeFrame = TimeFrame.all;
            break;
        }
        onTap?.call(timeFrame, context);
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
