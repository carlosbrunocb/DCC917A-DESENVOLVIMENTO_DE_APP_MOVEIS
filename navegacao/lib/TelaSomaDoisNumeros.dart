import 'package:flutter/material.dart';
import 'package:navegacao/ResultadoDaSoma.dart';
import 'package:navegacao/TelaSecundaria_v3.dart';

class TelaSomaDoisNumeros extends StatefulWidget {
  static const route = '/somaDoisNumeros';

  @override
  _TelaSomaDoisNumerosState createState() => _TelaSomaDoisNumerosState();
}

class _TelaSomaDoisNumerosState extends State<TelaSomaDoisNumeros> {
  TextEditingController _tXTEdiTCtrol_N1 = TextEditingController();
  TextEditingController _tXTEdiTCtrol_N2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // ModalRoute: Cria uma rota que bloqueia a interação com as rotas anteriores
    // of(): retorna o modal da rota mais proximamente associado com um dado contexto
    // settings: Retorna a configuração da roda (settings)
    // arguments: Acessa os argumentos acessado pela rota
    String _ctxtValor = ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
      appBar: AppBar(
        title: Text("Soma dois números"),
        backgroundColor: Colors.pinkAccent,
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              color: Colors.lime,
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  //widget: permite ter acesso aos atributos da classe
                  // TelaSecundaria_v2
                  "Valor Recuperado da Tela Principal:"
                  "\n>>> $_ctxtValor",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            TextField(
              keyboardType: TextInputType.number,
              controller: _tXTEdiTCtrol_N1,
              decoration: InputDecoration(
                labelText: "Entre com 1º número:",
                labelStyle: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            TextField(
              keyboardType: TextInputType.number,
              controller: _tXTEdiTCtrol_N2,
              decoration: InputDecoration(
                labelText: "Entre com 2º número:",
                labelStyle: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(
            context,
            TelaSecundaria_v3.route,
            arguments: ResultadoDaSoma(
              num.parse(_tXTEdiTCtrol_N1.text), 
              num.parse(_tXTEdiTCtrol_N2.text),
            ),
          );
        },
        tooltip: "Soma as entradas",
        child: Icon(
          Icons.add,
          size: 35,
        ),
      ),
    );
  }
}
