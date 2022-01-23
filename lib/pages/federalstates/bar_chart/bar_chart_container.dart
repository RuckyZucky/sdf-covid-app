import 'package:flutter/material.dart';
import 'package:sdf_covid/data/rki_data.dart';
import 'package:sdf_covid/pages/germany/widgets/bar_chart/bar_chart.dart';

class BarChartContainer extends StatelessWidget {
  final String title;
  final List<Data>? data;

  const BarChartContainer({
    Key? key,
    required this.title,
    required this.data
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.95,
        height: MediaQuery.of(context).size.width * 0.95 * 0.65,
        padding: const EdgeInsets.fromLTRB(0, 10, 20, 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              title,
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
            Expanded(
                child: Container(
                  padding: const EdgeInsets.only(top: 10),
                  child: BarChartContent(data: data),
                ))
          ],
        ),
      ),
    );
  }
}