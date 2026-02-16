import 'package:flutter/material.dart';

class EntradaCheckbox extends StatefulWidget {
  const EntradaCheckbox({Key? key}) : super(key: key);

  @override
  _EntradaCheckboxState createState() => _EntradaCheckboxState();
}

class _EntradaCheckboxState extends State<EntradaCheckbox> {
  bool _vcheck = false;
  bool _vcheckBR = false;
  bool _vcheckMX = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Entrada de dados"),
      ),
      body: Container(
        child: Column(
          children: [
            // Text("Comida Brasileira"),
            // Checkbox(
            //   value: _vcheck,
            //   onChanged: (bool? valor) {
            //     setState(() {
            //       // ! operador
            //       // para verificar se o valor é null
            //       _vcheck = valor!;
            //     });
            //     print("Checkbox: $valor");
            //   },
            // ),
            CheckboxListTile(
              title: Text("Comida Brasileira"),
              subtitle: Text("A melhor comida do mundo!!"),
              secondary: Icon(Icons.add_box),
              activeColor: Colors.lightBlueAccent,
              selected: _vcheckBR,
              value: _vcheckBR,
              onChanged: (bool? valor) {
                setState(() {
                  _vcheckBR = valor!;
                });
              },
            ),
            CheckboxListTile(
              title: Text("Comida Mexica"),
              subtitle: Text("A melhor comida do mundo!!"),
              secondary: Icon(Icons.add_box),
              activeColor: Colors.lightGreen,
              selected: _vcheckMX,
              value: _vcheckMX,
              onChanged: (bool? valor) {
                setState(() {
                  _vcheckMX = valor!;
                });
              },
            ),
            RaisedButton(
              child: Text("Salvar"),
              onPressed: (){
                print("Comida Brasileira: $_vcheckBR");
                print("Comida Mexicana: $_vcheckMX");
              },
            ),
          ],
        ),
      ),
    );
  }
}
