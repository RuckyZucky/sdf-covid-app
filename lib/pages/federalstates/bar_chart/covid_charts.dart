import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sdf_covid/bloc/federal_state/fedstate_page_bloc.dart';
import 'package:sdf_covid/bloc/federal_state/fedstate_page_event.dart';
import 'package:sdf_covid/bloc/federal_state/fedstate_page_state.dart';
import 'package:sdf_covid/bloc/germany_page/germany_page_bloc.dart';
import 'package:sdf_covid/bloc/germany_page/germany_page_event.dart';
import 'package:sdf_covid/bloc/germany_page/germany_page_state.dart';

import 'bar_chart_container.dart';

class CovidCharts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FedStatePageBloc, FedstatePageState>(
        builder: (context, state) {
      if (state is FedstatePageUninitialized) {
        context.read<FedStatePageBloc>().add(LoadFedStatePageData());
      }

      if (state is FedstatePageLoaded) {
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

      return Column(children: [Center(child: CircularProgressIndicator())]);
    });
  }
}
