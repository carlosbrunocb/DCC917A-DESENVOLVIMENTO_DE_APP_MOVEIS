import 'package:flutter/material.dart';

class EntradaSwitch extends StatefulWidget {
  const EntradaSwitch({Key? key}) : super(key: key);

  @override
  _EntradaSwitchState createState() => _EntradaSwitchState();
}

class _EntradaSwitchState extends State<EntradaSwitch> {
  bool _userChoice = false;
  bool _userChoice01 = false;
  bool _userChoice02 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Entrada de dados"),
      ),
      body: Container(
        // child: Row(
        child: Column(
          children: [
            // Switch(
            //   value: _userChoice,
            //   onChanged: (bool valor){
            //     setState(() {
            //       _userChoice = valor;
            //       print("Resultado = $_userChoice");
            //     });
            //   },
            // ),
            // Text("Receber notificações?"),
            SwitchListTile(
              title: Text(
                "Receber notificações",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text("Isso poderá consumir dados móveis"),
              secondary: Icon(Icons.add_alert),
              activeColor: Colors.green,
              selected: !_userChoice01,
              value: _userChoice01,
              onChanged: (bool valor) {
                setState(() {
                  _userChoice01 = valor;
                  // print("Resultado1 = $_userChoice01");
                });
              },
            ),
            SwitchListTile(
              title: Text(
                "Carregar imagens automaticamente",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              secondary: Icon(Icons.download_outlined),
              value: _userChoice02,
              onChanged: (bool valor) {
                setState(() {
                  _userChoice02 = valor;
                  // print("Resultado2 = $_userChoice02");
                });
              },
            ),
            RaisedButton(
              child: Text("Salvar"),
              onPressed: (){
                print("Resultado1: $_userChoice01");
                print("Resultado2: $_userChoice02");
              },
            ),
          ],
        ),
      ),
    );  }
}
