import 'package:consumo_servico_avancado/Post.dart';
import 'package:consumo_servico_avancado/Post1.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Home_v2 extends StatefulWidget {
  const Home_v2({Key? key}) : super(key: key);

  @override
  _Home_v2State createState() => _Home_v2State();
}

class _Home_v2State extends State<Home_v2> {
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

  // Usado para criar um novo recurso
  void _post() async {
    var url = Uri.parse(_urlBase + "/posts");
    http.Response response;
    var corpo = json.encode(
        {
          "userId": 1,
          "id": 1,
          "title": "",
          "body": ""
        }
    );

    response = await http.post(
      url,
      headers: {
        'Content-type': 'application/json; charset=UTF-8',
      },
      body: corpo,
    );

    print("resposta: ${response.statusCode}");
    print("resposta: ${response.body}");

  }

  void _post1() async {
    Post1 post1 = Post1(120, null, "Titulo", "Corpo da postagem");
    var url = Uri.parse(_urlBase + "/posts");
    http.Response response;
    var corpo = json.encode(post1.toJson());

    response = await http.post(
      url,
      headers: {
        'Content-type': 'application/json; charset=UTF-8',
      },
      body: corpo,
    );

    print("resposta: ${response.statusCode}");
    print("resposta: ${response.body}");
  }

  // Usado para atualizar o recurso inteiro
  void _put() async {
    var url = Uri.parse(_urlBase + "/posts/2");
    http.Response response;
    var corpo = json.encode(
        {
          "userId": 120,
          "id": null,
          "title": "Titulo alterado",
          "body": "Corpo da postagem alterada"
        }
    );

    response = await http.put(
      url,
      headers: {
        'Content-type': 'application/json; charset=UTF-8',
      },
      body: corpo,
    );

    print("resposta: ${response.statusCode}");
    print("resposta: ${response.body}");
  }

  // Usado para atualizar o recurso parcialmete
  void _patch() async {
    var url = Uri.parse(_urlBase + "/posts/2");
    http.Response response;
    var corpo = json.encode(
        {
          "userId": 120,
          "body": "Corpo da postagem alterada"
        }
    );

    response = await http.patch(
      url,
      headers: {
        'Content-type': 'application/json; charset=UTF-8',
      },
      body: corpo,
    );

    print("resposta: ${response.statusCode}");
    print("resposta: ${response.body}");
  }

  // Usado para remover um recurso
  void _delete() async {
    var url = Uri.parse(_urlBase + "/posts/2");
    http.Response response = await http.delete(url);

    print("resposta: ${response.statusCode}");
    print("resposta: ${response.body}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Consumo de Serviço Avançado e Lista"),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  child: Text(
                    "Salvar"
                    "\n(POST)",
                    textAlign: TextAlign.center,
                  ),
                  // onPressed: _post,
                  onPressed: _post1,
                ),
                ElevatedButton(
                  child: Text(
                    "Atualizar"
                    "\n(PUT)",
                    textAlign: TextAlign.center,
                  ),
                  onPressed: _put,
                ),
                ElevatedButton(
                  child: Text(
                    "Atualizar"
                    "\n(PATCH)",
                    textAlign: TextAlign.center,
                  ),
                  onPressed: _patch,
                ),
                ElevatedButton(
                  child: Text(
                    "Remover"
                    "\n(DELETE)",
                    textAlign: TextAlign.center,
                  ),
                  onPressed: _delete,
                ),
              ],
            ),
            Container(
              width: double.infinity,
              color: Colors.pinkAccent,
              child: Text(
                "GET",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
            Expanded(
              child: FutureBuilder<List<Post>>(
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
            ),
          ],
        ),
      )

    );
  }
}
