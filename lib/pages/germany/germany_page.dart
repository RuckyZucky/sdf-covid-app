import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sdf_covid/bloc/germany_page/germany_page_bloc.dart';
import 'package:sdf_covid/bloc/germany_page/germany_page_event.dart';
import 'package:sdf_covid/bloc/germany_page/germany_page_state.dart';
import 'package:sdf_covid/pages/germany/widgets/bar_chart/covid_charts.dart';
import 'package:sdf_covid/pages/germany/widgets/date_filter/date_filter.dart';

class GermanyPage extends StatelessWidget {
  const GermanyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      initialIndex: 3,
      child: BlocProvider<GermanyPageBloc>(
        create: (context) => GermanyPageBloc(),
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Aktuelle COVID-19 Situation - Deutschland'),
            bottom: const DateFilter()
          ),
          bottomNavigationBar: Hero(
            tag: 'BottomNavBar',
            child: BottomNavigationBar(
              currentIndex: 1,
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
                    Navigator.pushReplacementNamed(context, "/");
                    break;
                  case 1:
                    Navigator.pushReplacementNamed(context, "/germany");
                    break;
                }
              },
            ),
          ),
          body: Stack(
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
        ),
      ),
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

        return const SingleChildScrollView(
          child: CovidCharts()
        );
      },
    );
  }

}
