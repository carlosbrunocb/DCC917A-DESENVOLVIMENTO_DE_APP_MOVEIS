import 'package:consumo_servico_avancado/Post.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Home_v1 extends StatefulWidget {
  const Home_v1({Key? key}) : super(key: key);

  @override
  _Home_v1State createState() => _Home_v1State();
}

class _Home_v1State extends State<Home_v1> {
  String _urlBase = "https://jsonplaceholder.typicode.com";

  Future<List<Post>> _recuperarPostagens() async {
    var url = Uri.parse(_urlBase + "/posts");
    http.Response response = await http.get(url);
    var dadosJason = json.decode(response.body);
    List<Post> postagens = [];

    for (var post in dadosJason) {
      // print("post" + post['title']);
      Post p = Post(post['userId'], post['id'], post['title'], post['body']);
      postagens.add(p);
    }
    print(postagens.toString());
    return postagens;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Consumo de Serviço Avançado e Lista"),
      ),
      body: FutureBuilder<List<Post>>(
        future: _recuperarPostagens(),
        builder: (context, snapshot) {
          ListView? listView;

          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              print("conexão waiting");
              return Center(
                child: CircularProgressIndicator(),
              );
            case ConnectionState.done:
              print("conexão done");
              if (snapshot.hasError) {
                print("Erro: ${snapshot.error}");
              } else {
                print("lista:carregou!!");
                listView = ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Container(
                        color: Colors.lightBlueAccent,
                        width: double.infinity,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.all(5),
                              child: Text(
                                snapshot.data![index].id.toString() +
                                    ". " +
                                    snapshot.data![index].title,
                                textAlign: TextAlign.justify,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      subtitle: Container(
                        color: Colors.blueGrey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.all(5),
                              child: Text(
                                snapshot.data![index].body,
                                textAlign: TextAlign.justify,
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              }
              break;
          }
          return listView!;
        },
      ),
    );
  }
}
