import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "Frases do dia",
    home: HomeStateful(),
  ));
}

class HomeStateful extends StatefulWidget {
  @override
  _HomeStatefulState createState() => _HomeStatefulState();
}

class _HomeStatefulState extends State<HomeStateful> {
  var _texto = "App Stateful";
  var _ctrl = 0;

  @override
  Widget build(BuildContext context) {
    var _titulo = "Instagram";
    print("Build foi chamado!");

    return Scaffold(
      appBar: AppBar(
        title: Text(_titulo),
        backgroundColor: Colors.blueGrey,
      ),
      body: Container(
        child: Column(
          children: [
            RaisedButton(
              onPressed: () {
                setState(() {
                  //atualiza UI
                  if (_ctrl == 0) {
                    _texto = "App Flutter";
                    _ctrl = 1;
                  } else {
                    _texto = "App Stateful";
                    _ctrl = 0;
                  }
                });
              },
              color: Colors.lightBlueAccent,
              child: Text("Clique aqui"),
            ),
            Text("Nome: $_texto")
          ],
        ),
      ),
    );
  }
}
