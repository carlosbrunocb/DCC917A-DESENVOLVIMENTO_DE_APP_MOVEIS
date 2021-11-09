import 'package:flutter/material.dart';

class CustomSearchDelegate extends SearchDelegate<String> {

  //Defini os botões de ações na barra de busca
  @override
  List<Widget> buildActions(BuildContext context) {
    // TODO: implement buildActions
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = "";
        },
      ),
    ];
  }

  //
  @override
  Widget buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, "");
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    print("resultado: pesquisa realizada");
    close(context, query);
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    print("Digitado: $query");

    List<String> palavras = [];

    if(query.isNotEmpty){
      palavras = [
        "Android", "Android navegação", "IOS", "Jogos"
      ].where(
            (texto) => texto.toLowerCase().startsWith(query.toLowerCase())
      ).toList();

      print(palavras);

      return ListView.builder(
        itemCount: palavras.length,
        itemBuilder: (context, index) {
          return (palavras.isNotEmpty) ?
          ListTile(
            onTap: () => close(context, palavras[index]),
            title: Text(palavras[index]),
          ) :
          Center(
            child: Text("Nenhum resultado para a pesquisa"),
          );
        },
      );
    } else {
      return Center(
        child: Text("Nenhum resultado para a pesquisa"),
      );
    }
  }
}