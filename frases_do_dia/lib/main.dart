import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "Frases do dia",
    home: HomeStateful(),
  ));
}

class HomeStateful extends StatefulWidget {
  @override
  HomeStateful_State createState() => HomeStateful_State();
}

class HomeStateful_State extends State<HomeStateful> {
  var _titulo = "Frases do Dia";
  int _numeroAleatorio = 0;
  List _frases = [
    'O importante não é vencer todos os dias, mas, a jornada que nós leva a vitória ou a derrota.',
    'Mais vale um passáro na mão do que dois voando.',
    'O medo de perder tira a vontade de ganhar.',
    'Perder para a razão, sempre é ganhar!',
    'Você poderá encontrar o amor de sua vida'
  ];

  void _incrementCounter() {
    setState(() {
      _numeroAleatorio = new Random().nextInt(5); //0,1,2,3,4
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_titulo),
        backgroundColor: Colors.green,
      ),
      body: Container(
        padding: EdgeInsets.all(15),
        width: double.infinity,
        decoration: BoxDecoration(
            border: Border.all(width: 3, color: Colors.amberAccent)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              "images/logo.png",
              fit: BoxFit.none,
            ),
            Text(
              "${_frases[_numeroAleatorio]}",
              style: TextStyle(
                fontSize: 20,
                fontStyle: FontStyle.italic,
                color: Colors.black,
              ),
            ),
            RaisedButton(
              onPressed: () {
                _incrementCounter();
              },
              color: Colors.green,
              child: Text(
                "Nova Frase",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
