import 'package:flutter/material.dart';
import 'package:navegacao/TelaSecundaria.dart';

class TelaPrincipal extends StatefulWidget {
  const TelaPrincipal({Key? key}) : super(key: key);

  @override
  _TelaPrincipalState createState() => _TelaPrincipalState();
}

class _TelaPrincipalState extends State<TelaPrincipal> {
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
                      builder: (context) => TelaSecundaria(),
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
