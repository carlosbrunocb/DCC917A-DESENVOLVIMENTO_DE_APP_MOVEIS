import 'package:flutter/material.dart';

class Moeda extends StatefulWidget {

  String _iPath;
  Moeda(this._iPath);

  @override
  _MoedaState createState() => _MoedaState();
}

class _MoedaState extends State<Moeda> {

  void _voltarParaTelaHome(){
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff61bd86),
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(widget._iPath),
            Padding(padding: EdgeInsets.only(top: 30)),
            GestureDetector(
              onTap: (){
                _voltarParaTelaHome();
              },
              child: Image.asset("imagens/botao_voltar.png"),
            ),
          ],
        ),
      ),
    );
  }
}
