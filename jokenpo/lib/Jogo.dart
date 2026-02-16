import 'dart:math';

import 'package:flutter/material.dart';

class Jogo extends StatefulWidget {
  const Jogo({Key? key}) : super(key: key);
  @override
  _JogoState createState() => _JogoState();
}

class _JogoState extends State<Jogo> {

  var _idxIA = 0;
  var _idxPlayer = 0;
  var _colorPedra__ = Colors.transparent;
  var _colorPapel__ = Colors.transparent;
  var _colorTesoura = Colors.transparent;
  var _imageApp = AssetImage("images/padrao.png");

  var _iPath = [
    "images/padrao.png",
    "images/pedra.png",
    "images/papel.png",
    "images/tesoura.png"
  ];

  var _msgIA = [
    "IA pensando:",
    "IA jogou pedra:",
    "IA jogou papel:",
    "IA jogou tesoura:",
  ];

  var _msgPlayer = [
    "Faça sua jogada:",
    ":) Parabéns! Você ganhou! \\o/",
    "Empatou! :/",
    "Você perdeu! :("
  ];

  void _choiceIA() {
    _idxIA = new Random().nextInt(3); //0 1 2
    _idxIA++;
  }

  void _startGame(userChoice) {
    _choiceIA();
    _imageApp = AssetImage(_iPath[_idxIA]);

    switch (userChoice) {
      case 1:
        if(_idxIA == 3){
          _idxPlayer = 1;
          _colorPedra__ = Colors.greenAccent;
          _colorPapel__ = Colors.transparent;
          _colorTesoura = Colors.transparent;
        } else if(_idxIA == 2) {
          _idxPlayer = 3;
          _colorPedra__ = Colors.redAccent;
          _colorPapel__ = Colors.transparent;
          _colorTesoura = Colors.transparent;
        } else {
          _idxPlayer = 2;
          _colorPedra__ = Colors.lightBlueAccent;
          _colorPapel__ = Colors.transparent;
          _colorTesoura = Colors.transparent;
        }
        break;
      case 2:
        if(_idxIA == 1){
          _idxPlayer = 1;
          _colorPapel__ = Colors.greenAccent;
          _colorPedra__ = Colors.transparent;
          _colorTesoura = Colors.transparent;
        } else if(_idxIA == 3) {
          _idxPlayer = 3;
          _colorPapel__ = Colors.redAccent;
          _colorPedra__ = Colors.transparent;
          _colorTesoura = Colors.transparent;
        } else {
          _idxPlayer = 2;
          _colorPapel__ = Colors.lightBlueAccent;
          _colorPedra__ = Colors.transparent;
          _colorTesoura = Colors.transparent;
        }
        break;
      case 3:
        if(_idxIA == 2){
          _idxPlayer = 1;
          _colorTesoura = Colors.greenAccent;
          _colorPedra__ = Colors.transparent;
          _colorPapel__ = Colors.transparent;
        } else if(_idxIA == 1) {
          _idxPlayer = 3;
          _colorTesoura = Colors.redAccent;
          _colorPedra__ = Colors.transparent;
          _colorPapel__ = Colors.transparent;
        } else {
          _idxPlayer = 2;
          _colorTesoura = Colors.lightBlueAccent;
          _colorPedra__ = Colors.transparent;
          _colorPapel__ = Colors.transparent;
        }
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("JokenPo"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(top:30, bottom: 15),
            child: Text(
              _msgIA[_idxIA],
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Image(
            image: _imageApp,
          ),
          Padding(
            padding: EdgeInsets.only(top:25, bottom: 20),
            child: Text(
              _msgPlayer[_idxPlayer],
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    _startGame(1);
                  });
                },
                child: Container (
                  color: _colorPedra__,
                  child: Image.asset(
                    _iPath[1],
                    width: 100,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    _startGame(2);
                  });
                },
                child: Container (
                  color: _colorPapel__,
                  child: Image.asset(
                    _iPath[2],
                    width: 100,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    _startGame(3);
                  });
                },
                child: Container (
                  color: _colorTesoura,
                  child: Image.asset(
                    _iPath[3],
                    width: 100,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
