import 'package:minhas_anotacoes/helper/AnotacaoHelper.dart';

class Anotacao {

  int? id;
  String? titulo;
  String? descricao;
  String? data;

  Anotacao(this.titulo, this.descricao, this.data,{this.id});

  Anotacao.fromMap(Map map){
    this.id        = map[AnotacaoHelper.ATRIB_ID];
    this.titulo    = map[AnotacaoHelper.ATRIB_TITULO];
    this.descricao = map[AnotacaoHelper.ATRIB_DESCRICAO];
    this.data      = map[AnotacaoHelper.ATRIB_DATA];
  }

  Map<String, Object?> toMap(){
    return this.id != null ? {
      AnotacaoHelper.ATRIB_ID        : id,
      AnotacaoHelper.ATRIB_TITULO    : titulo,
      AnotacaoHelper.ATRIB_DESCRICAO : descricao,
      AnotacaoHelper.ATRIB_DATA      : data,
    } : {
      AnotacaoHelper.ATRIB_TITULO    : titulo,
      AnotacaoHelper.ATRIB_DESCRICAO : descricao,
      AnotacaoHelper.ATRIB_DATA      : data,
    };
  }

}