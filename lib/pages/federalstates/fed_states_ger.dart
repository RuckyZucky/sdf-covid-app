import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sdf_covid/bloc/germany_page/germany_page_bloc.dart';
import 'package:sdf_covid/bloc/germany_page/germany_page_event.dart';
import 'package:sdf_covid/bloc/germany_page/germany_page_state.dart';
import 'package:sdf_covid/bloc/federal_state/fedstate_page_bloc.dart';
import 'package:sdf_covid/bloc/federal_state/fedstate_page_event.dart';
import 'package:sdf_covid/bloc/federal_state/fedstate_page_state.dart';
import 'package:sdf_covid/pages/federalstates/widgets/state_filter/fed_states_drop.dart';
import 'package:sdf_covid/pages/germany/timeframe.dart';
import 'package:sdf_covid/pages/germany/widgets/bar_chart/bar_chart_container.dart';
import 'package:sdf_covid/pages/federalstates/bar_chart/covid_charts.dart';
import 'package:sdf_covid/pages/federalstates/widgets/date_filter/date_filter.dart';

class FederalPage extends StatelessWidget {
  const FederalPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Aktuelle COVID-19 Situation - Bundesländer'),
        ),
        body: BlocProvider<FedStatePageBloc>(
          create: (context) => FedStatePageBloc(),
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
                child: _FederalPageContent(),
              )
            ],
          ),
        ));
  }
}

class _FederalPageContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FedStatePageBloc,FedstatePageState>(
      builder: (context, state) {
        if (state is FedstatePageUninitialized) {
        context.read<FedStatePageBloc>().add(LoadFedStatePageData());
        }

        return ListView(
            children: [
              DateFilter(),
              FedStateFilter(),
              CovidCharts(),


            ]
        );
      },
    );
  }
}
