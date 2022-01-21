import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sdf_covid/bloc/germany_page/germany_page_bloc.dart';
import 'package:sdf_covid/bloc/germany_page/germany_page_event.dart';
import 'package:sdf_covid/bloc/germany_page/germany_page_state.dart';

import 'bar_chart_container.dart';

class CovidCharts extends StatelessWidget {
  const CovidCharts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GermanyPageBloc, GermanyPageState>(
        builder: (context, state) {
      if (state is GermanyPageUninitialized) {
        context.read<GermanyPageBloc>().add(LoadGermanyPageData());
      }

      if (state is GermanyPageLoaded) {
        var barChartCases =
            BarChartContainer(title: "Fälle", data: state.cases);
        var barChartDeaths =
            BarChartContainer(title: "Tode", data: state.deaths);
        var barChartHospitalizations = BarChartContainer(
            title: "Hospitalisierungen", data: state.hospitalization);

        return Column(
          children: [
            barChartCases,
            barChartDeaths,
            barChartHospitalizations
          ]
        );
      }

      return const SizedBox(
        height: 150.0,
        child:  Center(child: CircularProgressIndicator())
      );
    });
  }
}
