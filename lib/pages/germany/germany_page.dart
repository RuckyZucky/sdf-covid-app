import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sdf_covid/bloc/germany_page/germany_page_bloc.dart';
import 'package:sdf_covid/bloc/germany_page/germany_page_event.dart';
import 'package:sdf_covid/bloc/germany_page/germany_page_state.dart';
import 'package:sdf_covid/data/rki_data.dart';
import 'package:sdf_covid/pages/germany/bar_chart_container.dart';
import 'package:sdf_covid/pages/home/widgets/data_text.dart';

import 'package:fl_chart/fl_chart.dart';

class GermanyPage extends StatelessWidget {
  const GermanyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Aktuelle COVID-19 Situation - Deutschland'),
      ),
      body: BlocProvider<GermanyPageBloc>(
        create: (context) => GermanyPageBloc(),
        child: Stack(
          children: [
            Positioned(
              top: 0,
              right: 0,
              bottom: 0,
              child: Image.asset('assets/images/virus.png', alignment: Alignment.centerRight,),
            ),
            Positioned.fill(
              child: _GermanyPageContent(),
            )
          ],
        ),
      )
    );
  }

}

class _GermanyPageContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GermanyPageBloc, GermanyPageState>(
      builder: (context, state) {
        if (state is GermanyPageUninitialized) {
          context.read<GermanyPageBloc>().add(LoadGermanyPageData());
        }

        if (state is GermanyPageLoaded) {
          var barChartCases = ChartContainer(title: "Fälle", data: state.cases);
          var barChartDeaths = ChartContainer(title: "Tode", data: state.deaths);
          var barChartHospitalizations = ChartContainer(title: "Hospitalisierungen", data: state.hospitalization);

          return ListView(
            padding: const EdgeInsets.symmetric(vertical: 36.0, horizontal: 24.0),
            children: [
              barChartCases,
              barChartDeaths,
              barChartHospitalizations
            ]
          );
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }

}
