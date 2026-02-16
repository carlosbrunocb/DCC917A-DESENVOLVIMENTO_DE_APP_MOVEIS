import 'package:flutter/material.dart';

class TelaCliente extends StatefulWidget {
  const TelaCliente({Key? key}) : super(key: key);

  @override
  _TelaClienteState createState() => _TelaClienteState();
}

class _TelaClienteState extends State<TelaCliente> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Cliente"),
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
                  Image.asset("imagens/detalhe_cliente.png"),
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text(
                      "CLIENTES",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.lightGreen,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(children: [
                  Image.asset("imagens/cliente1.png"),
                  Text("Empresa de software"),
                ]),
                Column(
                  children: [
                    Image.asset("imagens/cliente2.png"),
                    Text("Empresa de auditoria"),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
