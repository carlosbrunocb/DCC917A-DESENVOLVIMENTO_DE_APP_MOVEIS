import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var _ipath = 'images/logo.png';
  var _msg = "Saiba qual a melhor opção para "
      "abastecimento do seu carro";
  var _resultado = [
    "O álcool seria a melhor escolha!",
    "A gasolina seria a melhor opção!",
    "Entrada de dados inválida! "
    "\nTroque , por ."
    "\nou insirar os valores!",
    ""
  ];
  var _idx = 3;
  var _fcolor = [
    Colors.blueGrey,
    Colors.blueAccent,
    Colors.redAccent,
    Colors.transparent
  ];

  TextEditingController _controllerAlcool = TextEditingController();
  TextEditingController _controllerGasolina = TextEditingController();

  void _calcular(){

    double precoAlcool;
    double precoGasolina;
    var res;

    try {
      precoAlcool = double.parse(_controllerAlcool.text);
      precoGasolina = double.parse(_controllerGasolina.text);

      /*
      * Se o preço do álcool dividido pelo preço da gasolina
      * for >= a 0.7 compensa abastecer com gasolina
      * senão é melhor utilizar álcool
      * */
      res = precoAlcool/precoGasolina;

      if(res >= 0.7) {
        _idx = 1;
      } else {
        _idx = 0;
      }
    } catch (e) {
      print(e);
      _idx = 2;
    }
  }

  void _limparCampos(){
    _controllerGasolina.text = "";
    _controllerAlcool.text = "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Álcool ou Gasolina"),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset(
                _ipath,
                fit: BoxFit.fitWidth,
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: 32,
                  bottom: 10,
                ),
                child: Text(
                  _msg,
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText:"Preço do Álcool, ex.:3.56"
                ),
                style: TextStyle(
                    fontSize: 22
                ),
                controller: _controllerAlcool,
              ),
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Preço da Gasolina, ex.:5.56",
                ),
                style: TextStyle(
                    fontSize: 22
                ),
                controller: _controllerGasolina,
              ),
              Padding(
                padding: EdgeInsets.only(top: 10,bottom: 20),
                child: RaisedButton(
                  onPressed: (){
                    setState(() {
                      _calcular();
                    });
                    _limparCampos();
                  },
                  color: Colors.blue,
                  textColor: Colors.white,
                  padding: EdgeInsets.all(15),
                  child: Text(
                    "Calcular",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Text(
                _resultado[_idx],
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w900,
                  color: _fcolor[_idx],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
