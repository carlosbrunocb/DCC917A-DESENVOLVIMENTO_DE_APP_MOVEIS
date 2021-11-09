import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:youtube/utilitary/StringDeBusca.dart';
import 'package:youtube/model/Video.dart';

const KEY_YOUTUBE_API = "AIzaSyAncX73jHQf_9Im3y2nKxW87h10PmVMb3Q";
const ID_CANAL = "UCVHFbqXqoYvEWM1Ddxl0QDg";
const URL_BASE = "https://www.googleapis.com/youtube/v3/";

class Api {


  // List videos = [];

  Future<List<Video>> pesquisar({
    required String pesquisa,
    part = StringDeBusca.PART_SNIPPET_VALUE,
    type = StringDeBusca.TYPE_VIDEO_VALUE,
    maxResults = StringDeBusca.MAX_RESULTS_20_VALUE,
    order = StringDeBusca.ORDER_DATE_VALUE,
    channelID = "",
  }) async {

    List<Video> videos = [];
    // channelID = "$ID_CANAL";
    var strBusca = StringDeBusca.SEARCH_RESOURCE +
        StringDeBusca.PART_OPT + part +
        StringDeBusca.TYPE_OPT + type +
        StringDeBusca.MAX_RESULTS_OPT + maxResults +
        StringDeBusca.ORDER_OPT + order +
        StringDeBusca.KEY_OPT + "$KEY_YOUTUBE_API" +
        StringDeBusca.CHANNEL_ID_OPT + channelID +
        StringDeBusca.QUERY_OPT + "$pesquisa";
    var uri = Uri.parse(URL_BASE + strBusca);
    http.Response response = await http.get(uri,);

    print("uri:" + uri.toString());

    if(response.statusCode == 200){
      // print("resposta: ${response.body}");

      Map<String, dynamic> dadosJason = json.decode(response.body);

      videos = dadosJason["items"].map<Video>(
          (map)=>Video.converterJson(map)
      ).toList();

      // for(var video in videos){
      //   print("-----------");
      //   print("${video.id}");
      //   print("${video.titulo}");
      //   print("${video.imagem}");
      //   print("${video.canal}");
      // }

    } else {

    }

    return videos;
  }
}