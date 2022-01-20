import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sdf_covid/bloc/germany_page/germany_page_bloc.dart';
import 'package:sdf_covid/bloc/germany_page/germany_page_event.dart';
import 'package:sdf_covid/bloc/germany_page/germany_page_state.dart';
import 'package:sdf_covid/data/timeframe.dart';
import 'package:sdf_covid/pages/germany/widgets/bar_chart/bar_chart_container.dart';
import 'package:sdf_covid/pages/germany/widgets/bar_chart/covid_charts.dart';
import 'package:sdf_covid/pages/germany/widgets/date_filter/date_filter.dart';

class GermanyPage extends StatelessWidget {
  const GermanyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Deutschland'),
        ),
        body: BlocProvider<GermanyPageBloc>(
          create: (context) => GermanyPageBloc(),
          child: Stack(
            children: [
              Positioned(
                top: 0,
                right: 0,
                bottom: 0,
                child: Image.asset(
                  'assets/images/virus.png',
                  alignment: Alignment.centerRight,
                ),
              ),
              Positioned.fill(
                child: _GermanyPageContent(),
              )
            ],
          ),
        ));
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

        return ListView(
          children: [
            DateFilter(),
            CovidCharts()
          ]
        );
      },
    );
  }
}
