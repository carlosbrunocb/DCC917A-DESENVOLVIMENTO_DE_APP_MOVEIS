import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home_Ex_Dismissible extends StatefulWidget {
  const Home_Ex_Dismissible({Key? key}) : super(key: key);

  @override
  _Home_Ex_DismissibleState createState() => _Home_Ex_DismissibleState();
}

class _Home_Ex_DismissibleState extends State<Home_Ex_Dismissible> {
  List<String> _listaString = [];
  TextEditingController _novaEntrada = TextEditingController();

  _adicionaElementoNaLista() {
    if(_novaEntrada.text != "") {
      setState(() {
        _listaString.add(_novaEntrada.text);
      });
      _novaEntrada.text = "";
    }
  }

  AlertDialog _builderDialogAddTask() {
    return AlertDialog(
      title: Text("Adicionar uma string"),
      titleTextStyle: TextStyle(
        color: Colors.blue,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      titlePadding: EdgeInsets.all(10),
      content: TextField(
        keyboardType: TextInputType.text,
        // style: TextStyle(),
        decoration: InputDecoration(
          labelText: "Digite uma string:",
          labelStyle: TextStyle(color: Colors.blue),
        ),
        controller: _novaEntrada,
      ),
      contentPadding: EdgeInsets.all(10),
      actions: [
        ElevatedButton(
          child: Text(
            "Cancelar",
            style: TextStyle(color: Colors.blue),
          ),
          style: ElevatedButton.styleFrom(
              primary: Colors.transparent,
              shadowColor: Colors.transparent,
              padding: EdgeInsets.only(right: 5)),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        ElevatedButton(
          child: Text(
            "Salvar",
            style: TextStyle(color: Colors.blue),
          ),
          style: ElevatedButton.styleFrom(
              primary: Colors.transparent,
              shadowColor: Colors.transparent,
              padding: EdgeInsets.only(left: 5)),
          onPressed: () {
            _adicionaElementoNaLista();
            Navigator.pop(context);
          },
        ),
      ],
      actionsPadding: EdgeInsets.only(left: 5),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text("Widgets (Exemplo de uso de Dismissible)"),
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(5),
        itemCount: _listaString.length,
        itemBuilder: (context, index) {
          return Dismissible(
            // direction: DismissDirection.vertical,
            background: Container(
              color: Colors.blue,
              padding: EdgeInsets.all(16),
              child: Row(
                children: [
                  Icon(
                    Icons.edit,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
            secondaryBackground: Container(
              color: Colors.red,
              padding: EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Icon(
                    Icons.delete,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
            // direction: DismissDirection.vertical,
            onDismissed: (direction) {
              if(direction == DismissDirection.startToEnd){
                print("direção: startToEnd");
              } else {
                print("direção: endToStart");
              }
              setState(() {
                _listaString.removeAt(index);
              });
              // print("direção: ${direction}");
            },
            key: Key(_listaString[index]),
            child: ListTile(
              title: Text(_listaString[index]),
            ),
          );
          
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Colors.purple,
        foregroundColor: Colors.white,
        elevation: 10,
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => _builderDialogAddTask(),
          );
        },
      ),
    );
  }
}