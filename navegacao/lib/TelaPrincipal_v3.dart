import 'package:flutter/material.dart';
import 'package:navegacao/TelaSecundaria_v3.dart';
import 'package:navegacao/TelaSomaDoisNumeros.dart';

class TelaPrincipal_v3 extends StatefulWidget {
  static const route = '/';

  @override
  _TelaPrincipalState_v3 createState() => _TelaPrincipalState_v3();
}

class _TelaPrincipalState_v3 extends State<TelaPrincipal_v3> {
  TextEditingController _valor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tela Principal"),
        backgroundColor: Colors.orange,
      ),
      body: Container(
        padding: EdgeInsets.all(32),
        child: Column(
          children: [
            TextField(
              keyboardType: TextInputType.text,
              controller: _valor,
              decoration: InputDecoration(
                labelText: "Entre com um texto",
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 10),
            ),
            RaisedButton(
              child: Text("Ir para Tela Soma Dois Números"),
              padding: EdgeInsets.all(15),
              onPressed: () {
                // context: indica qual é a tela em que app se encontra.
                //          Contexto, informa que a próxima tela será
                //          empilhada sobre "o contexto"
                //          (tela que foi passada com parâmetro)
                // _tSecundaria: define a rota, para onde a tela atual esta indo.
                //        Isso pode ser definido usando a
                //        classe "MaterialPageRoute".
                Navigator.pushNamed(
                  context,
                  TelaSomaDoisNumeros.route,
                  arguments: _valor.text,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
