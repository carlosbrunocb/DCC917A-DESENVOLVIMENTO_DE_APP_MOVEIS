import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // primarySwatch: Colors.blue,
        primarySwatch: Colors.lightGreen,
      ),
      // home: MyHomePage(title: 'Flutter Demo Home Page'),
      // home: MyHomePage(title: 'Olá mundo!'),
      home: MyHomePage(title: 'Frases do dia'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // int _counter = 0;
  int _numeroAleatorio = 0;
  List _frases = [
    'O importante não é vencer todos os dias, mas jornada que nós leva a vitória ou a derrota.',
    'Mas vale um passáro na mão do que dois voando.',
    'O medo de perder tira a vontade de ganhar.',
    'Perder para a razão, sempre é ganhar'
  ];

  void _incrementCounter() {
    setState(() {
      // _counter++;
      _numeroAleatorio = new Random().nextInt(4); //0,1,2,3
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              // 'You have pushed the button this many times:',
              // 'O número de vezes que o botão foi pressionado foi:',
              'Pressione o botão para gerar uma frase:',
            ),
            Text(
              // '$_counter',
              // '$_numeroAleatorio',
              _frases[_numeroAleatorio],
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
