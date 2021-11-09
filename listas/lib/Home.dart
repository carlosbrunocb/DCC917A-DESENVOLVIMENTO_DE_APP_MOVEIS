import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List? _itens;

  void _carregarItens(){

    _itens = [];

    for(int i=0; i<=10; i++){
      Map<String, dynamic> item = Map();
      item["titulo"] = "Título ${i}, um exemplo de título na Lista.";
      item["descricao"] = "Descrição ${i} isso é um exemplos de descrição na Lista.";
      _itens!.add(item);
    }
  }

  @override
  Widget build(BuildContext context) {

    _carregarItens();

    return Scaffold(
      appBar: AppBar(
        title: Text("Lista"),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: ListView.builder(
          itemCount: _itens!.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(_itens![index]['titulo']),
              subtitle: Text(_itens![index]['descricao']),
              onTap: (){
                // print("clique com OnTap $index");
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text(_itens![index]['titulo']),
                    titlePadding: EdgeInsets.all(20),
                    titleTextStyle: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    content: Text(
                      _itens![index]['descricao'],
                      textAlign: TextAlign.justify,
                    ),
                    contentPadding: EdgeInsets.all(15),
                    contentTextStyle: TextStyle(
                      fontSize: 16,
                      color: Colors.black87,
                    ),
                    backgroundColor: Colors.orangeAccent,
                    actions: [
                      ElevatedButton(
                        onPressed: (){
                          print("Foi selecionado sim");
                          Navigator.pop(context); //fecha a tela
                        },
                        child: Text("Sim"),
                      ),
                      ElevatedButton(
                        onPressed: (){
                          print("Foi selecionado não");
                        },
                        child: Text("Não"),
                      ),
                    ],
                  ),
                );
              },
              onLongPress: (){
                print("clique com onLongPress $index");
              },
            );
          },
        ),
      ),
    );
  }
}
