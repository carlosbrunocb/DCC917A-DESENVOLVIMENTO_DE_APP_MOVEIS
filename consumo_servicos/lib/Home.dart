import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Color _corDoFundo = Colors.transparent;
  Map<String, dynamic> _retorno = {};
  TextEditingController _cep = TextEditingController();

  void _recuperarCEP() async{
    String inCEP = _cep.text;
    var url = Uri.parse("https://viacep.com.br/ws/$inCEP/json/");
    http.Response response;


    response = await http.get(url);

    print("Código de Status: " + response.statusCode.toString());
    print("Resposta: " + response.body);

    setState(() {
      _retorno = json.decode(response.body);
      _corDoFundo = Colors.pinkAccent;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Consumo de serviço web"),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Informe o CEP (Ex.: 05428200)",
              ),
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              controller: _cep,
            ),
            Padding(padding: EdgeInsets.only(bottom: 20)),
            ElevatedButton(
              child: Text("Recupera Endereço"),
              onPressed: (){
                _recuperarCEP();
              },
            ),
            Container(
              padding: EdgeInsets.all(10),
              color: _corDoFundo,
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Text("CEP:"
                            "\nLogradouro:"
                            "\nComplemento:"
                            "\nBairro:"
                            "\nCidade:"
                            "\nUF:",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Text("${_retorno["cep"]}"
                              "\n${_retorno["logradouro"]}"
                              "\n${_retorno["complemento"]}"
                              "\n${_retorno["bairro"]}"
                              "\n${_retorno["localidade"]}"
                              "\n${_retorno["uf"]}",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
