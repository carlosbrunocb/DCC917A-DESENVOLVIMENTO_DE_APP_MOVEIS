import 'package:flutter/material.dart';

class TelaServico extends StatefulWidget {
  const TelaServico({Key? key}) : super(key: key);

  @override
  _TelaServicoState createState() => _TelaServicoState();
}

class _TelaServicoState extends State<TelaServico> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Serviços"),
        backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 20),
              child: Row(
                children: [
                  Image.asset("imagens/detalhe_servico.png"),
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text(
                      "NOSSOS SERVIÇOS",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.lightBlueAccent,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 16),
              child: Text(
                "*  Consultoria",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.green,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 16),
              child: Text(
                "*  Cálculo de preços",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.green,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 16),
              child: Text(
                "*  Acompanhamento de projetos",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.green,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
