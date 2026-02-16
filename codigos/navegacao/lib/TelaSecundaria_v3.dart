import 'package:flutter/material.dart';
import 'package:navegacao/ResultadoDaSoma.dart';
import 'package:navegacao/TelaPrincipal_v3.dart';

class TelaSecundaria_v3 extends StatefulWidget {
  static const route = '/secundaria';
  ResultadoDaSoma? _minhaSoma;

  TelaSecundaria_v3(minhaSoma){
    this._minhaSoma = minhaSoma;
  }

  @override
  _TelaSecundariaState_v3 createState() => _TelaSecundariaState_v3();
}

class _TelaSecundariaState_v3 extends State<TelaSecundaria_v3> {
  // ResultadoDaSoma minhaSoma;

  @override
  Widget build(BuildContext context) {
    // ModalRoute: Cria uma rota que bloqueia a interação com as rotas anteriores
    // of(): retorna O modal da rota mais proximamente associado com um dado contexto
    // settings: Retorna a configuração da roda (settings)
    // argumrnts: Acessa os argumentos acessado pela rota
    String _ctxtValor = ModalRoute.of(context)!.settings.arguments.toString();

    return Scaffold(
      appBar: AppBar(
        title: Text("Tela Secundária"),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        padding: EdgeInsets.all(32),
        child: Column(
          children: [
            Text(
              //widget: permite ter acesso aos atributos da classe
              // TelaSecundaria_v2
              "Segunda Tela!"
              "\n<<<Operação Recebida >>> "
              "\n  ${widget._minhaSoma!.n1} + ${widget._minhaSoma!.n2} = "
              "${widget._minhaSoma!.soma} ",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.blueGrey,
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.pushNamed(context, TelaPrincipal_v3.route);
        },
        tooltip: "Voltar para Home",
        child: Icon(Icons.home),
      ),
    );
  }
}
