import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  static const String key = "dadosArmazenados";

  String _dados = "Nada Salvo";
  TextEditingController _entrada = TextEditingController();

  _salvar() async {
    String valorDigitado = _entrada.text;

    final prefs = await SharedPreferences.getInstance();
    prefs.setString(key, valorDigitado);
    print("operação (salvar): $valorDigitado");
  }

  _recuperar() async{
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _dados = prefs.getString(key)?? "Sem valor";
    });
    print("operação (recuperar): $_dados");
  }

  _remover() async{
    final prefs = await SharedPreferences.getInstance();
    prefs.remove(key);
    print("operação (remover)");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Manipulação de Dados"),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Text(
              _dados,
              style: TextStyle(fontSize: 20),
            ),
            TextField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelText: "Digite:",
              ),
              controller: _entrada,
            ),
            Row(
              children: [
                ElevatedButton(
                  child: Text("Salvar"),
                  onPressed: _salvar,
                ),
                ElevatedButton(
                  child: Text("Recuperar"),
                  onPressed: _recuperar,
                ),
                ElevatedButton(
                  child: Text("Remover"),
                  onPressed: _remover,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
