import 'package:flutter/material.dart';

class EntradaSlider extends StatefulWidget {
  const EntradaSlider({Key? key}) : super(key: key);

  @override
  _EntradaSliderState createState() => _EntradaSliderState();
}

class _EntradaSliderState extends State<EntradaSlider> {
  double _userChoice = 5;
  String _vLabel = "0";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Entrada de dados"),
      ),
      body: Container(
        // child: Row(
        padding: EdgeInsets.only(top: 40),
        child: Column(
          children: [
            Slider(
              value: _userChoice,
              min: 0,
              max: 10,
              divisions: 5,
              label: _vLabel,
              activeColor: Colors.blueGrey,
              inactiveColor: Colors.lightBlueAccent,
              onChanged: (double novoValor){
                setState(() {
                  _userChoice = novoValor;
                  _vLabel = novoValor.toString();
                });
                // print("Valor selececionado: $novoValor");
              },
            ),
            RaisedButton(
              child: Text("Salvar"),
              onPressed: (){
                print("Valor selececionado: $_userChoice");
              },
            ),
          ],
        ),
      ),
    );
  }
}
