import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sdf_covid/data/rki_data.dart';

class BarChartContent extends StatelessWidget {
  final List<Data>? data;

  const BarChartContent({
    Key? key,
    required this.data
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var chartGroupData = data?.asMap().entries.map((entry) {
      int x = entry.key;
      double y = entry.value.count.toDouble();

      return BarChartGroupData(x: x, barRods: [ BarChartRodData(y: y) ]);
    }).toList();

    double? maxY = data?.map((e) => e.count.toDouble()).reduce((curr, next) => curr > next? curr: next);

    return BarChart(
        BarChartData(
          maxY: maxY,
          barGroups: chartGroupData
        )
    );
  }

}