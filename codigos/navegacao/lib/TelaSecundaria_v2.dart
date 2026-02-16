import 'package:flutter/material.dart';

class TelaSecundaria_v2 extends StatefulWidget {

  String? valor;

  // TelaSecundaria_v2(this.valor);
  TelaSecundaria_v2({this.valor});

  @override
  _TelaSecundariaState_v2 createState() => _TelaSecundariaState_v2();
}

class _TelaSecundariaState_v2 extends State<TelaSecundaria_v2> {
  @override
  Widget build(BuildContext context) {
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
                "\nValor passado: ${widget.valor}",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.blueGrey,
              ),
            )
          ],
        ),
      ),
    );
  }
}
