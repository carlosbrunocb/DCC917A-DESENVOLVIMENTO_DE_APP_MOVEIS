import 'package:flutter/material.dart';

class EntradaRadioButton extends StatefulWidget {
  const EntradaRadioButton({Key? key}) : super(key: key);

  @override
  _EntradaRadioButtonState createState() => _EntradaRadioButtonState();
}

class _EntradaRadioButtonState extends State<EntradaRadioButton> {
  String? _userchoice;

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
            // Text("Masculino"),
            // Radio(
            //   value: "M",
            //   groupValue: _userchoice,
            //   onChanged: (String? escolha){
            //     setState(() {
            //       _userchoice = escolha;
            //     });
            //     print("Resultado: $escolha");
            //   },
            // ),
            // Text("Feminino"),
            // Radio(
            //   value: "F",
            //   groupValue: _userchoice,
            //   onChanged: (String? escolha){
            //     setState(() {
            //       _userchoice = escolha;
            //     });
            //     print("Resultado: $escolha");
            //   },
            // ),
            RadioListTile(
              title: Text("Masculino"),
              subtitle: Text(
                "Homem com H",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  // color: Colors.pink,
                ),
              ),
              // activeColor: Colors.pinkAccent,
              // selected: false,
              secondary: Icon(Icons.account_circle),
              value: "M",
              groupValue: _userchoice,
              onChanged: (String? escolha) {
                setState(() {
                  _userchoice = escolha;
                });
                // print("Resultado: $escolha");
              },
            ),
            RadioListTile(
              title: Text("Feminino"),
              value: "F",
              groupValue: _userchoice,
              onChanged: (String? escolha) {
                setState(() {
                  _userchoice = escolha;
                });
                // print("Resultado: $escolha");
              },
            ),
            RaisedButton(
              child: Text("Salvar"),
              onPressed: (){
                print("Resultado: $_userchoice");
              },
            ),
          ],
        ),
      ),
    );
  }
}
