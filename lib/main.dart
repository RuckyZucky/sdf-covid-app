import 'package:flutter/material.dart';

import 'pages/home/home_page.dart';
import 'pages/germany/germany_page.dart';

void main() {
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
        "/germany": (context) => const GermanyPage()
      }
    );
  }
}
