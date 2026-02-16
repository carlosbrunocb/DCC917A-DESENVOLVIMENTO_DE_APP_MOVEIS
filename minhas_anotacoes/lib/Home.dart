import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:minhas_anotacoes/helper/AnotacaoHelper.dart';
import 'package:minhas_anotacoes/model/Anotacao.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  TextEditingController _entradaTitulo = TextEditingController();
  TextEditingController _entradaDescricao = TextEditingController();
  var _db = AnotacaoHelper();
  List<Anotacao>? _anotacoes;
  String? _confirmacao;

  _exibirTelaCadastro({Anotacao? anotacao}) {

    if(anotacao==null){
      _entradaTitulo.clear();
      _entradaDescricao.clear();
      _confirmacao = "Salvar";
    } else {
      _entradaTitulo.text = anotacao.titulo!;
      _entradaDescricao.text = anotacao.descricao!;
      _confirmacao = "Atualizar";
    }

    showDialog(
      context: context,
      builder: (context) {
        return _builderAlertDialog(anotacao: anotacao);
      },
    );
  }

  _recuperarAnatocoes() async {
    List anatocoesRecuperadas = await _db.recuperarAnatocoes();
    List<Anotacao>? listaTemp = [];

    for(var item in anatocoesRecuperadas){
      listaTemp.add(Anotacao.fromMap(item));
    }

    setState(() {
      _anotacoes = listaTemp;
    });

    listaTemp = null;

    //print("Lista de Anotações: ${anatocoesRecuperadas}");
  }

  _recuperarAnatocoesRemovida(Anotacao anotacao) async{
    int resultado = await _db.salvarAnotacao(anotacao);
    print("Anotação $resultado foi salva no BD");
    _recuperarAnatocoes();
  }

  _salvarAtualizarAnotacao({Anotacao? anotacao}) async {
    String titulo = _entradaTitulo.text;
    String descricao = _entradaDescricao.text;
    String data = DateTime.now().subtract(Duration(hours: 4)).toString();
    int resultado;
    // print("data atual: " + DateTime.now().subtract(Duration(hours: 4)).toString());

    if(anotacao==null){
      anotacao = Anotacao(titulo, descricao, data);
      resultado = await _db.salvarAnotacao(anotacao);
      print("Anotação $resultado foi salva no BD");
    } else {
      anotacao.titulo    = _entradaTitulo.text;
      anotacao.descricao = _entradaDescricao.text;
      anotacao.data      = data;

      resultado = await _db.atualizarAnotacao(anotacao);
      print("Anotação $resultado foi atualizada no BD");

    }

    _recuperarAnatocoes();
  }

  _removerAnotacao(int id) async {
    await _db.removerAnotacao(id);

    _recuperarAnatocoes();
  }

  _formatarData(String data){

    initializeDateFormatting("pt_BR");

    //Year -> month-> M Day -> d
    //Hour -> H minute -> m second ->
    // var formatador = DateFormat("d/M/y H:m:s");
    var formatador = DateFormat("d/MM/y HH:mm:s");
    // var formatador = DateFormat("d/MMMM/y H:m:s");
    // var formatador = DateFormat.yMd("pt_BR");
    // var formatador = DateFormat.yMMMd("pt_BR");
    DateTime dataConvertida = DateTime.parse(data);
    String dataFormatada = formatador.format(dataConvertida);

    return dataFormatada;
  }

  Widget _builderAlertDialog({Anotacao? anotacao}) {
    return AlertDialog(
      title: (anotacao==null) ?
        Text("Adicionar anotação") : Text("Atualizar anotação"),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            keyboardType: TextInputType.text,
            controller: _entradaTitulo,
            autofocus: true,
            decoration: InputDecoration(
              labelText: "Título",
              hintText: "Digite o título ...",
            ),
          ),
          TextField(
            keyboardType: TextInputType.text,
            controller: _entradaDescricao,
            decoration: InputDecoration(
              labelText: "Descrição",
              hintText: "Digite a descrição ...",
            ),
          ),
        ],
      ),
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
          onPressed: () => Navigator.pop(context),
        ),
        ElevatedButton(
          child: Text(
            _confirmacao!,
            style: TextStyle(color: Colors.blue),
          ),
          style: ElevatedButton.styleFrom(
              primary: Colors.transparent,
              shadowColor: Colors.transparent,
              padding: EdgeInsets.only(right: 5)),
          onPressed: () {
            _salvarAtualizarAnotacao(anotacao: anotacao);
            Navigator.pop(context);
          },
        ),
      ],
    );
  }

  Widget _builderSnackbar(Anotacao anotacao){
    return SnackBar(
      backgroundColor: Colors.lightGreen,
      duration: Duration(seconds: 5),
      content: ListTile(
        title: Text(
          "Anotação Removida!",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        subtitle: Text(
          anotacao.titulo!,
          style: TextStyle(color: Colors.white),
        ),
      ),
      action: SnackBarAction(
        textColor: Colors.black,
        label: "Desfazer",
        onPressed: () {
          _recuperarAnatocoesRemovida(anotacao);
        },
      ),

    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _recuperarAnatocoes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Minhas anotações"),
        backgroundColor: Colors.lightGreen,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _anotacoes!.length,
              itemBuilder: (context, index) {
                final item = _anotacoes![index];

                return Card(
                  // color: Color(0xBFBAF5B1),
                  shadowColor: Colors.greenAccent,
                  child: ListTile(
                    title: Text(item.titulo!),
                    subtitle: Text("${_formatarData(item.data!)} \n${item.descricao!}"),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        GestureDetector(
                          child: Padding(
                            padding: EdgeInsets.only(right: 15),
                            child: Icon(
                              Icons.edit,
                              color: Colors.green,
                            ),
                          ),
                          onTap: () {
                            _exibirTelaCadastro(anotacao: item);
                          },
                        ),
                        GestureDetector(
                          child: Icon(
                            Icons.remove_circle,
                            color: Colors.red,
                          ),
                          onTap: () {
                            Anotacao temp = item;
                            _removerAnotacao(item.id!);
                            SnackBar snackbar = _builderSnackbar(temp) as SnackBar;
                            ScaffoldMessenger.of(context).showSnackBar(snackbar);
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        child: Icon(Icons.add),
        onPressed: () {
          _exibirTelaCadastro();
        },
      ),
    );
  }
}
