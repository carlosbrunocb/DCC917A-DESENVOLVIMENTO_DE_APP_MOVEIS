import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:youtube/Api.dart';
import 'package:youtube/model/Video.dart';
import 'package:youtube/telas/YtbVideoPlayer.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';


class Inicio extends StatefulWidget {
  String? pesquisa;

  Inicio(this.pesquisa);

  @override
  _InicioState createState() => _InicioState();
}

class _InicioState extends State<Inicio> {

  _listarVideos(String pesquisa) {
    Api api = Api();
    return api.pesquisar(pesquisa: pesquisa);
  }

  Widget builderListView(Video video){
    return Column(
      children: [
        Container(
          height: 200,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(video.imagem!),
            ),
          ),
        ),
        ListTile(
          title: Column(
            children: [
              Text(
                video.titulo!,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 5, bottom: 5),
                child: Text(
                  video.canal!,
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(90, 90, 90, 1),
                  ),
                ),
              ),
            ],
          ),
          subtitle: Text(
            video.descricao!,
            textAlign: TextAlign.justify,
          ),
        ),
      ],
    );
  }

  FutureBuilder<List<Video>> buildFutureBuider() {
    return FutureBuilder(
      future: _listarVideos(widget.pesquisa!),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            print("conexão waiting");
            return Center(child: CircularProgressIndicator());
          case ConnectionState.done:
            print("conexão done");
            if (snapshot.hasData) {
              return ListView.separated(
                itemBuilder: (context, index) {
                  List<Video> videos = snapshot.data!;
                  Video video = videos[index];

                  return GestureDetector(
                    onTap: () {
                      print("# Video ${index}");
                      print("\n  id: ${video.id}");
                      print("\n  Título: ${index}: ${video.titulo}");

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => YtbVideoPlayer(video.id),
                        ),
                      );

                    },
                    child: builderListView(video),
                  );
                },
                separatorBuilder: (context, index) => Divider(
                  height: 15,
                  color: Colors.grey,
                ),
                itemCount: snapshot.data!.length,
              );
            } else {
              return Text("Nenhum video pode ser exibido!");
            }
        }
        return Text("");
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(child: buildFutureBuider());
  }
}
