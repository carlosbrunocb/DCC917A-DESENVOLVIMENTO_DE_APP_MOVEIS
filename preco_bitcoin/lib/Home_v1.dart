import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:preco_bitcoin/CotacaoBitcoin.dart';

class Home_v1 extends StatefulWidget {
  const Home_v1({Key? key}) : super(key: key);

  @override
  _Home_v1State createState() => _Home_v1State();
}

class _Home_v1State extends State<Home_v1> {
  Future<CotacaoBitcoin>? _cotacao;

  Future<CotacaoBitcoin> _criaCotacaoBitcoin() async {
    var url = Uri.parse("https://blockchain.info/ticker");
    http.Response response = await http.get(url);
    Map<String, dynamic> cotacao = json.decode(response.body);

    print("Código de Status: " + response.statusCode.toString());
    print("Cotação: ${cotacao['BRL']['buy']}");

    return CotacaoBitcoin(
      buy: cotacao[CotacaoBitcoin.BRL][CotacaoBitcoin.BUY],
      sell: cotacao[CotacaoBitcoin.BRL][CotacaoBitcoin.SELL],
      last: cotacao[CotacaoBitcoin.BRL][CotacaoBitcoin.LAST],
      symbol: cotacao[CotacaoBitcoin.BRL][CotacaoBitcoin.SYMBOL],
    );
  }

  FutureBuilder<CotacaoBitcoin> buildFutureBuider() {
    return FutureBuilder(
      future: _cotacao,
      builder: (context, snapshot) {

        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            print("conexão waiting");

            return CircularProgressIndicator(
              color: Color.fromRGBO(247, 147, 26, 1),
            );
          case ConnectionState.done:
            print("conexão done");

            if (snapshot.hasError) {
              return Text("${snapshot.error}");
            } else {
              double buy = snapshot.data!.buy;
              String symbol = snapshot.data!.symbol;
              return Text("\$$symbol ${buy.toString()}");
            }
        }
        return Text("");
      },
    );
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
              Padding(
                padding: EdgeInsets.only(bottom: 30,top:30),
                child: (_cotacao == null)? Text(""):buildFutureBuider(),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          setState(() {
            _cotacao = _criaCotacaoBitcoin();
          });
        },
        backgroundColor: Color.fromRGBO(247, 147, 26, 1),
        child: Icon(Icons.attach_money),
        tooltip: "Buscar Cotação",
      ),
    );
  }
}
