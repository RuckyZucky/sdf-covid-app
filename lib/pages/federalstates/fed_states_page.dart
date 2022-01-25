import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sdf_covid/bloc/federal_state/fedstate_page_bloc.dart';
import 'package:sdf_covid/bloc/federal_state/fedstate_page_event.dart';
import 'package:sdf_covid/bloc/federal_state/fedstate_page_state.dart';
import 'package:sdf_covid/pages/federalstates/widgets/bar_chart/covid_charts.dart';
import 'package:sdf_covid/pages/federalstates/widgets/state_filter/fed_states_drop.dart';
import 'package:sdf_covid/util/widgets/date_filter.dart';

class FederalPage extends StatelessWidget {
  const FederalPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      initialIndex: 3,
      child: BlocProvider<FedStatePageBloc>(
        create: (context) => FedStatePageBloc(),
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Bundesländer'),
            bottom: DateFilter(
              onTap: (timeFrame, ctx) => ctx.read<FedStatePageBloc>().add(LoadFedStatePageData(timeframe: timeFrame)),
            ),
          ),
          body: Stack(
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
          bottomNavigationBar: Hero(
            tag: 'BottomNavBar',
            child: BottomNavigationBar(
              currentIndex: 2,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.map),
                  label: 'Deutschland',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.map_outlined),
                  label: 'Bundesländer',
                ),
              ],
              onTap: (index){
                switch(index){
                  case 0:
                    Navigator.pushReplacementNamed(context, '/');
                    break;
                  case 1:
                    Navigator.pushReplacementNamed(context, '/germany');
                    break;
                  case 2:
                    // current page -> do nothing
                    break;
                }
              },
            ),
          ),
        ),
      ),
    );
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
              FedStateFilter(),
              CovidCharts(),
            ]
        );
      },
    );
  }
}
