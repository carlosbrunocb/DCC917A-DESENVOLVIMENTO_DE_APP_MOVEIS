import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String _cotacao = "";
  Map<String, dynamic> _retorno = {};

  void _cotacaoBitcoin() async {
    var url = Uri.parse("https://blockchain.info/ticker");
    http.Response response;

    response = await http.get(url);
    _retorno = json.decode(response.body);

    print("Código de Status: " + response.statusCode.toString());
    print("Cotação: ${_retorno['BRL']['buy']}");

    setState(() {
      _cotacao = "R\$ ${_retorno['BRL']['buy']}";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("image/bitcoin.png"),
              Padding(padding: EdgeInsets.only(bottom: 30)),
              Text(
                _cotacao,
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 77, 77, 77),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _cotacaoBitcoin,
        backgroundColor: Color.fromRGBO(247, 147, 26, 1),
        child: Icon(Icons.attach_money),
        tooltip: "Buscar Cotação",
      ),
    );
  }
}
