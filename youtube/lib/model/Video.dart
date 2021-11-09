import 'package:youtube/utilitary/DataQuery.dart';

class Video {
  String? id;
  String? titulo;
  String? descricao;
  String? imagem;
  String? canal;

  Video({this.id, this.titulo, this.descricao, this.imagem, this.canal});

  static Video converterJson(Map<String, dynamic> json) {
    return Video(
      id: json[DataQuery.ID_VALUE][DataQuery.VIDEO_ID_VALUE],
      titulo: json[DataQuery.SNIPPET_VALUE][DataQuery.TITLE_VALUE],
      descricao: json[DataQuery.SNIPPET_VALUE][DataQuery.DESCRIPTION_VALUE],
      imagem: json[DataQuery.SNIPPET_VALUE][DataQuery.THUMBNAILS_VALUE]
          [DataQuery.HIGH_VALUE][DataQuery.URL_VALUE],
      canal: json[DataQuery.SNIPPET_VALUE][DataQuery.CHANNEL_TITLE_VALUE],
    );
  }

  factory Video.fromJson(Map<String, dynamic> json) {
    return Video(
      id: json[DataQuery.ID_VALUE][DataQuery.VIDEO_ID_VALUE],
      titulo: json[DataQuery.SNIPPET_VALUE][DataQuery.TITLE_VALUE],
      descricao: json[DataQuery.SNIPPET_VALUE][DataQuery.TITLE_VALUE],
      imagem: json[DataQuery.SNIPPET_VALUE][DataQuery.THUMBNAILS_VALUE]
          [DataQuery.HIGH_VALUE][DataQuery.URL_VALUE],
      canal: json[DataQuery.SNIPPET_VALUE][DataQuery.CHANNEL_TITLE_VALUE],
    );
  }
}
