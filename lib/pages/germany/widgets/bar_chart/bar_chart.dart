import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:sdf_covid/data/rki_data.dart';

class BarChartContent extends StatelessWidget {
  final List<Data>? data;

  const BarChartContent({
    Key? key,
    required this.data
  }) : super(key: key);

  double getInterval(int length) {
    switch(length) {
      case 7: return 6;
      case 30: return 7;
      case 365: return 120;
      default: return length / 4;
    }
  }

  @override
  Widget build(BuildContext context) {

    var chartGroupData = data?.asMap().entries.map((entry) {
      int x = entry.key;
      double y = entry.value.count.toDouble();

      return BarChartGroupData(
        x: x,
        barRods: [
          BarChartRodData(
            y: y,
            width: 150 / data!.length,
          ),
        ],
      );
    }).toList();

    double? maxY = data?.map((e) => e.count.toDouble()).reduce((curr, next) => curr > next? curr: next);
    if (maxY != null) {
      maxY *= 1.25;
    }

    return BarChart(
      BarChartData(
        maxY: maxY,
        barGroups: chartGroupData,
        titlesData: FlTitlesData(
          leftTitles: SideTitles(showTitles: false),
          topTitles: SideTitles(showTitles: false),
          rightTitles: SideTitles(
            showTitles: true,
            margin: 16.0,
            reservedSize: 40,
          ),
          bottomTitles: SideTitles(
            showTitles: true,
            interval: getInterval(data?.length ?? 1),
            getTitles: (value) => data == null ? '' : DateFormat.MMMd('de').format(data![value.floor()].date),
          ),
        ),
        borderData: FlBorderData(
          show: false,
        ),
        gridData: FlGridData(
          show: false,
        ),
        barTouchData: BarTouchData(
          touchTooltipData: BarTouchTooltipData(
            getTooltipItem: (group, groupIndex, rod, rodIndex) {
              final textStyle = TextStyle(
                color: rod.colors.first,
                fontWeight: FontWeight.bold,
                fontSize: 14,
              );
              return BarTooltipItem(
                rod.y.toString(),
                textStyle,
                children: [
                  TextSpan(
                    text: '\n${DateFormat.yMMMMd('de').format(data![groupIndex].date)}'
                  )
                ]
              );
            },
          )
        )
      )
    );
  }

}
