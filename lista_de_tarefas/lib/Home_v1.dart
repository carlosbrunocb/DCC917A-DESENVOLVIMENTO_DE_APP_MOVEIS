import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

import 'dart:convert';

class Home_v1 extends StatefulWidget {
  const Home_v1({Key? key}) : super(key: key);

  @override
  _Home_v1State createState() => _Home_v1State();
}

class _Home_v1State extends State<Home_v1> {
  List _listaDeTarefas = [];
  TextEditingController _novaTarefa = TextEditingController();
  Map<String, dynamic>? _tarefaRemovida;

  static const String KEY_TITULO = "titulo";
  static const String KEY_REALIZADA = "realizada";

  Future<File> _getFile() async {
    final pathDiretorio = await getApplicationDocumentsDirectory();
    print("Caminho: " + pathDiretorio.path);

    return File("${pathDiretorio.path}/dados.json");
  }

  _lerArquivo() async {
    try {
      final arquivo = await _getFile();
      return arquivo.readAsString();
    } catch (e) {
      return null;
    }
  }

  _salvarArquivo() async {
    final arquivo = await _getFile();
    //Criar dados
    //Estrutura
    // [
    //   {
    //     titulo: "Ir ao mercado",
    //     realizada: true
    //   },
    //   {
    //     titulo: "Estudar",
    //     realizada: false
    //   },
    //   ...,
    //   {...}
    //   {...},
    // ]
    Map<String, dynamic> tarefa = Map();
    tarefa[KEY_TITULO] = _novaTarefa.text;
    tarefa[KEY_REALIZADA] = false;
    _novaTarefa.text = "";

    setState(() {
      _listaDeTarefas.add(tarefa);
    });

    String dados = json.encode(_listaDeTarefas);
    arquivo.writeAsString(dados);

    print("Dados: " + dados);
  }

  _atualizarDados() async {
    final arquivo = await _getFile();
    String dados = json.encode(_listaDeTarefas);
    arquivo.writeAsString(dados);
  }

  AlertDialog _builderDialogAddTask() {
    return AlertDialog(
      title: Text("Adicionar Lembrete"),
      titleTextStyle: TextStyle(
        color: Colors.blue,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      titlePadding: EdgeInsets.all(10),
      content: TextField(
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          labelText: "Digite sua anotação",
          labelStyle: TextStyle(color: Colors.blue),
        ),
        controller: _novaTarefa,
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
            if (_novaTarefa.text != "") {
              _salvarArquivo();
            }
            Navigator.pop(context);
          },
        ),
      ],
      actionsPadding: EdgeInsets.only(left: 5),
    );
  }

  Widget _builderItem(context, index) {
    return Dismissible(
      background: Container(
        color: Colors.red,
        padding: EdgeInsets.all(10),
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
      direction: DismissDirection.endToStart,
      onDismissed: (direction) {
        setState(() {
          _tarefaRemovida = _listaDeTarefas[index];
          _listaDeTarefas.removeAt(index);
          _atualizarDados();

          final snackbar = SnackBar(
            backgroundColor: Colors.purpleAccent,
            duration: Duration(seconds: 5),
            content: ListTile(
              title: Text(
                "Tarefa Removida!",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              subtitle: Container(
                padding: EdgeInsets.only(top: 5),
                child: Row(
                  children: [
                    Icon(
                      Icons.remove_circle,
                      color: Colors.white,
                    ),
                    Padding(padding: EdgeInsets.only(left: 5)),
                    Text(
                      _tarefaRemovida![KEY_TITULO],
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
            action: SnackBarAction(
              textColor: Color(0xFF3F0044),
              label: "Desfazer",
              onPressed: () {
                setState(() {
                  _listaDeTarefas.insert(index, _tarefaRemovida);
                  _atualizarDados();
                });
                print("Ultima ação foi desfeita!");
              },
            ),
          );

          ScaffoldMessenger.of(context).showSnackBar(snackbar);
        });
        // print("direção: ${direction}");
      },
      key: Key(_listaDeTarefas[index][KEY_TITULO]),
      child: CheckboxListTile(
        title: Text(_listaDeTarefas[index][KEY_TITULO]),
        secondary: Icon(Icons.add_box),
        // IconButton(
        //   icon: Icon(Icons.add_box),
        //   onPressed: () {
        //     print("add more information");
        //   },
        // ),
        activeColor: Colors.lightBlueAccent,
        selected: _listaDeTarefas[index][KEY_REALIZADA],
        value: _listaDeTarefas[index][KEY_REALIZADA],
        onChanged: (bool? valor) {
          setState(() {
            _listaDeTarefas[index][KEY_REALIZADA] = valor!;
            _atualizarDados();

          });
        },
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _lerArquivo().then((dados) {
      setState(() {
        _listaDeTarefas = (dados != null) ? json.decode(dados) : [];
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text("Lista de tarefas"),
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(5),
        itemCount: _listaDeTarefas.length,
        itemBuilder: _builderItem,
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
