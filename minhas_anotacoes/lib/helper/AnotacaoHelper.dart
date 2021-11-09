import 'package:minhas_anotacoes/model/Anotacao.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class AnotacaoHelper {
  static const String NOME_TABELA = "anotacao";
  static const String ATRIB_ID = "id";
  static const String ATRIB_TITULO = "titulo";
  static const String ATRIB_DESCRICAO = "descricao";
  static const String ATRIB_DATA = "data";

  // Padrão GoF - Singleton (padrão de criação)
  // Permite que um objeto seja estanciado um única vez
  static final AnotacaoHelper _anotacaoHelper = AnotacaoHelper._internal();
  Database? _db;

  factory AnotacaoHelper (){
    return _anotacaoHelper;
  }

  AnotacaoHelper._internal();

  Future<Database> get db async {
    if(_db != null){
      return _db!;
    } else{
      _db = await inicializarDB();
      return _db!;
    }
  }

  _onCreateDB(db, version) {
    // id titulo descricao data
    // 01 exTit  exDesc    02/10/2020
    String sql =//
        "CREATE TABLE anotacao ("
        "id INTEGER PRIMARY KEY AUTOINCREMENT, "
        "titulo VARCHAR, "
        "descricao TEXT, "
        "data DATATIME"
        ")";
    db.execute(sql);
  }

  inicializarDB() async {
    final String pathDirDB = await getDatabasesPath();
    final String pathDB = join(pathDirDB, "bd_minhas_anotacoes.db");

    var bd = await openDatabase(
      pathDB,
      version: 1,
      onCreate: _onCreateDB,
    );
    return bd;
  }

  Future<int> salvarAnotacao(Anotacao anotacao) async {
    var bancoDados = await db;
    int id = await bancoDados.insert(NOME_TABELA, anotacao.toMap());

    return id;
  }

  Future<int> atualizarAnotacao(Anotacao anotacao) async {
    var bancoDados = await db;
    int id = await bancoDados.update(
      NOME_TABELA,
      anotacao.toMap(),
      where: "id = ?",
      whereArgs: [anotacao.id]
    );

    return id;
  }

  Future<int> removerAnotacao(int id) async{
    var bancoDados = await db;
    return await bancoDados.delete(
        NOME_TABELA,
        where: "id = ?",
        whereArgs: [id]
    );
  }

  recuperarAnatocoes() async{

    var bancoDados = await db;
    String sql = "SELECT * FROM $NOME_TABELA ORDER BY $ATRIB_DATA DESC";
    List anotacoes = await bancoDados.rawQuery(sql);

    return anotacoes;
  }
}