import 'dart:math';

import 'package:cara_ou_coroa/Moeda.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Jogar extends StatefulWidget {
  @override
  _JogarState createState() => _JogarState();
}

class _JogarState extends State<Jogar> {
  int? _idx;
  List<String> _iPath = [
    "imagens/moeda_cara.png",
    "imagens/moeda_coroa.png"
  ];

  void _sorteiaMoeda(){
    _idx = Random().nextInt(_iPath.length); //0 1
  }

  void _abrirJogo() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Moeda(_iPath[_idx!])),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(97, 189, 140, 1.0),
      // backgroundColor: Color.fromARGB(255,97, 189, 140),
      // backgroundColor: Colors.green,
      // backgroundColor: Color(0xff61bd8c),
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset("imagens/logo.png"),
            Padding(padding: EdgeInsets.only(top: 30)),
            GestureDetector(
              onTap: () {
                _sorteiaMoeda();
                _abrirJogo();
              },
              child: Image.asset("imagens/botao_jogar.png"),
            ),
          ],
        ),
      ),
    );
  }
}
