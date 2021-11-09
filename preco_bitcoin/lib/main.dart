import 'package:preco_bitcoin/Home.dart';
import 'package:flutter/material.dart';
import 'package:preco_bitcoin/Home_v1.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: TextTheme(
          bodyText2: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 77, 77, 77),
          ),
        ),
      ),
      // home: Home(),
      home: Home_v1(),
    );
  }
}
