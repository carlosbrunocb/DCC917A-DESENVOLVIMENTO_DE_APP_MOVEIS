import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CampoTexto extends StatefulWidget {
  const CampoTexto({Key? key}) : super(key: key);

  @override
  _CampoTextoState createState() => _CampoTextoState();
}

class _CampoTextoState extends State<CampoTexto> {
  TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Entrada de dados"),
          backgroundColor: Colors.blue,
        ),
        body: Container(
          padding: EdgeInsets.all(32),
          child: Column(
            children: [
              TextField(
                //Mascara: text, number, emailAddress, datetime
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: "Digite um valor",
                ),
                // Permite desabilitar a entrada de dados
                // enabled: false,
                // Defini o número máximo de caracteres de entrada
                // maxLength: 2,
                // Defini se é possivel ultrapassar o tamanho
                // máximo da string definida em maxLength
                maxLengthEnforcement: MaxLengthEnforcement.enforced,
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.green
                ),
                // obscureText: true, //Habilita o modo texto escondido
                // recupera o valor sempre um caractere é digitado
                // ou ocorre uma mundança na string mostrada no
                // campo de texto
                // onChanged: (String texto){
                //   print("valor digitado:" + texto);
                // },
                // recupera o texto no momento de sua submissão
                onSubmitted: (var texto){
                  print("valor digitado:" + texto);
                },
                // controlador do campo de texto
                controller: _textEditingController,
              ),
              RaisedButton (
                child: Text("Salvar"),
                color: Colors.lightGreen,
                onPressed: (){
                  // print("valor digitado: ${_textEditingController.text}");
                },
              ),
            ],
          ),
        )
    );
  }
}
