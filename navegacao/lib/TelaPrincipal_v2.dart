import 'package:flutter/material.dart';
import 'package:navegacao/TelaSecundaria.dart';
import 'package:navegacao/TelaSecundaria_v2.dart';

class TelaPrincipal_v2 extends StatefulWidget {
  const TelaPrincipal_v2({Key? key}) : super(key: key);

  @override
  _TelaPrincipalState_v2 createState() => _TelaPrincipalState_v2();
}

class _TelaPrincipalState_v2 extends State<TelaPrincipal_v2> {
  TextEditingController _valor  = TextEditingController();

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
              child: Text("Ir para Tela secundária"),
              padding: EdgeInsets.all(15),
              onPressed: (){
                // context: indica qual é a tela em que app se encontra.
                //          Contexto, informa que a próxima tela será
                //          empilhada sobre "o contexto"
                //          (tela que foi passada com parâmetro)
                // route: define a rota, para onde a tela atual esta indo.
                //        Isso pode ser definido usando a
                //        classe "MaterialPageRoute".
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TelaSecundaria_v2(valor: _valor.text,),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
