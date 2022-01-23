import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sdf_covid/bloc/home_page/home_page_bloc.dart';
import 'package:sdf_covid/bloc/home_page/home_page_event.dart';
import 'package:sdf_covid/bloc/home_page/home_page_state.dart';
import 'package:sdf_covid/pages/home/widgets/data_text.dart';


class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Aktuelle COVID-19 Situation - Deutschland'),
      ),
      body: BlocProvider<HomePageBloc>(
        create: (context) => HomePageBloc(),
        child: Stack(
          children: [
            Positioned(
              top: 0,
              right: 0,
              bottom: 0,
              child: Image.asset('assets/images/virus.png', alignment: Alignment.centerRight,),
            ),
            Positioned.fill(
              child: _HomePageContent(),
            )
          ],
        ),
      ),
      bottomNavigationBar: Hero(
        tag: 'BottomNavBar',
        child: BottomNavigationBar(
          currentIndex: 0,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.map),
              label: 'Deutschland'
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.map_outlined),
              label: 'Bundesländer'
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
              case 2:
                Navigator.pushReplacementNamed(context, "/fedstates");
                break;
            }
          }
        ),
      ),
    );
  }

}

class _HomePageContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomePageBloc, HomePageState>(
      builder: (context, state) {
        if (state is HomePageUninitialized) {
          context.read<HomePageBloc>().add(LoadHomePageData());
        }

        if (state is HomePageLoaded) {
          return ListView(
            padding: const EdgeInsets.symmetric(vertical: 36.0, horizontal: 24.0),
            children: [
              DataText(
                title: const Text('Neue Fälle / 24h'),
                data: state.cases?.count.toDouble(),
              ),
              DataText(
                title: const Text('Verstorben / 24h'),
                data: state.deaths?.count.toDouble(),
              ),
              DataText(
                title: Text('7 Tage Inzidenz'),
                data: state.incidence?.count.toDouble(),
              ),
              DataText(
                title: const Text('Hospitalisierungen'),
                data: state.hospitalization?.count.toDouble(),
              ),
            ],
          );
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }

}
