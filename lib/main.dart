import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl_standalone.dart';
import 'package:sdf_covid/pages/federalstates/fed_states_page.dart';

import 'pages/germany/germany_page.dart';
import 'pages/home/home_page.dart';

void main() async {
  var locale = await findSystemLocale();
  initializeDateFormatting(locale);
  runApp(const CovidApp());
}

class CovidApp extends StatelessWidget {
  const CovidApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'COVID-19 Statistiken',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        "/": (context) => const HomePage(),
        "/germany": (context) => const GermanyPage(),
        "/fedstates": (context) => const FederalPage()
      }
    );
  }
}
