import 'package:consumo_servico_avancado/Home.dart';
import 'package:consumo_servico_avancado/Home_v1.dart';
import 'package:consumo_servico_avancado/Home_v2.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: Home(),
      // home: Home_v1(),
      home: Home_v2(),
    );
  }
}