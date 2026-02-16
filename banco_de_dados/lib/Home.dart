import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:sqflite/utils/utils.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  _recuperarBancoDados() async {
    //recupera o caminho de onde o BD é salvo
    //E cria nome do BD e concatena com o local de onde deve ser salvo
    final String caminhoDirBD = await getDatabasesPath();
    final localBancoDados = join(caminhoDirBD,"banco.db");

    var bd = await openDatabase(
      localBancoDados,
      version: 1,
      onCreate: (db, version) {
        String sql = "CREATE TABLE usuarios ("
            "id INTEGER PRIMARY KEY AUTOINCREMENT, nome VARCHAR, "
            "idade INTEGER)";
        db.execute(sql);
      },
    );

    print("Caminho: ${localBancoDados}");
    print("Aberto:" + bd.isOpen.toString());
    return bd;
  }

  _salvar() async {
    Database bd = await _recuperarBancoDados();
    Map<String, dynamic> dadosUsuario = {
      "nome"  : "Guilherma dos Santos",
      "idade" : 21,
    };
    int id = await bd.insert("usuarios", dadosUsuario);
    print("ID do dado salvo: $id");

  }

  _listarUsuarios() async {
    Database bd = await _recuperarBancoDados();
    // String sql = "SELECT * FROM usuarios WHERE idade < 22";
    // String sql = "SELECT * FROM usuarios WHERE idade = 23 OR idade = 18";
    // String sql = "SELECT * FROM usuarios WHERE idade BETWEEN 30 AND 60";
    // String sql = "SELECT * FROM usuarios WHERE idade IN (18,23)";
    // String sql = "SELECT * FROM usuarios WHERE nome LIKE '%an%' ";
    // String sql = "SELECT * FROM usuarios WHERE 1=1 ORDER BY nome ASC";
    // String sql = "SELECT * FROM usuarios WHERE 1=1 ORDER BY UPPER(nome) ASC";
    // String sql = "SELECT * FROM usuarios WHERE 1=1 ORDER BY UPPER(nome) DESC";
    // String sql = "SELECT * FROM usuarios WHERE 1=1 ORDER BY idade DESC LIMIT 3";
    String sql = "SELECT * FROM usuarios";
    List usuarios = await bd.rawQuery(sql);

    print("usuarios: ${usuarios.toString()}");


    for(var usuario in usuarios){
      print("________");
      print("item id: " + usuario["id"].toString() +
            "\nnome: " + usuario["nome"].toString() +
           "\nidade: " + usuario["idade"].toString());
    }
  }

  _recuperarUsuarioPeloID(int id) async {
    Database bd = await _recuperarBancoDados();

    //CRUD -> Create, Read, Update and Delete
    List usuarios = await bd.query(
      "usuarios",
      columns: ['id', 'nome', 'idade'],
      where: "id = ? ",
      whereArgs: [id],
    );

    for(var usuario in usuarios){
      print("---USUÁRIO RECUPERADO---");
      print("item id: " + usuario["id"].toString() +
          "\nnome: " + usuario["nome"].toString() +
          "\nidade: " + usuario["idade"].toString());
    }
  }

  _excluirUsuario(int id) async {
    Database bd = await _recuperarBancoDados();

    int retorno = await bd.delete(
      "usuarios",
      where: "id = ?",
      whereArgs: [id],
    );

    print("Quantidade Removida: $retorno");
  }

  _atualizarUsuario(int id) async {
    Database bd = await _recuperarBancoDados();

    Map<String, dynamic> values = {
      "nome"  : "Alan Ferreira (Alterado novamente)",
      "idade" : 42,
    };

    int retorno = await bd.update(
      "usuarios",
      values,
      where: "id = ?",
      whereArgs: [id],
    );

    print("Quantidade Alterada: $retorno");
  }

  @override
  Widget build(BuildContext context) {

    // _recuperarBancoDados();
    // _salvar();
    // _listarUsuarios();
    _recuperarUsuarioPeloID(4);
    // _recuperarUsu4ioPeloID(9);
    // _excluirUsuario(10);
    // _recuperarUsuarioPeloID(9);
    // _atualizarUsuario(4);

    return Container();
  }
}
