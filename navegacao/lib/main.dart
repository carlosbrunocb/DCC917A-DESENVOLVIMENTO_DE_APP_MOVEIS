import 'package:flutter/material.dart';
import 'package:navegacao/ResultadoDaSoma.dart';
import 'package:navegacao/TelaPrincipal.dart';
import 'package:navegacao/TelaPrincipal_v2.dart';
import 'package:navegacao/TelaPrincipal_v3.dart';
import 'package:navegacao/TelaSecundaria_v3.dart';
import 'package:navegacao/TelaSomaDoisNumeros.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: TelaPrincipal_v3.route,
      routes: {
        TelaSomaDoisNumeros.route: (context) => TelaSomaDoisNumeros(),
      },
      //onGenerateRoute: O retorno de chamada do gerador de rota
      // é usado quando o aplicativo é navegado para uma rota nomeada.
      // Ele recebe como entrada um função que verifica se há uma rota e
      // implementa como os dados devem ser passados para Tela a ser aberta.
      onGenerateRoute: (setting){
        if(setting.name == TelaSecundaria_v3.route){
          ResultadoDaSoma minhaSoma = setting.arguments as ResultadoDaSoma;

          return MaterialPageRoute(
            // builder: (context){
            //   return TelaSecundaria_v3(minhaSoma);
            // },
            builder: (context) => TelaSecundaria_v3(minhaSoma),
          );
        }
      },
      // home: TelaPrincipal(),
      // home: TelaPrincipal_v2(),
      home: TelaPrincipal_v3(),
    );
  }
}

