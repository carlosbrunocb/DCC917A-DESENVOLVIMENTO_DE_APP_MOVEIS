class StringDeBusca {
  //Tipos de Recursos
  static const VIDEOS_RESOURCE = "videos";
  static const SEARCH_RESOURCE = "search";
  static const PLAYLISTS_RESOURCE = "playlists";
  static const SUBSCRIPTIONS_RESOURCE = "subscriptions";
  static const COMMENTS_RESOURCE = "comments";

  //Parâmetros de consulta
  // key: chave de acesso
  // channelId: limita a busca de video
  //  ao canal espedificado
  static const KEY_OPT = "&key=";
  static const PART_OPT = "?part=";
  static const TYPE_OPT = "&type=";
  static const MAX_RESULTS_OPT = "&maxResults=";
  static const ORDER_OPT = "&order=";
  static const CHANNEL_ID_OPT = "&channelId=";
  static const QUERY_OPT = "&q=";

  //Opções de valores para os parâmetros
  //PART
  static const PART_SNIPPET_VALUE = "snippet";
  static const PART_ID_VALUE = "id";

  //TYPE
  static const TYPE_CHANNEL_VALUE = "channel";
  static const TYPE_PLAYLIST_VALUE = "playlist";
  static const TYPE_VIDEO_VALUE = "video";

  //MAX_RESULTS
  static const MAX_RESULTS_10_VALUE = "10";
  static const MAX_RESULTS_20_VALUE = "20";
  static const MAX_RESULTS_30_VALUE = "30";
  static const MAX_RESULTS_40_VALUE = "40";
  static const MAX_RESULTS_50_VALUE = "50";

  //ORDER
  static const ORDER_DATE_VALUE = "date";
  static const ORDER_RATING_VALUE = "rating";
  static const ORDER_RELEVANCE_VALUE = "relevance";
  static const ORDER_VIDEO_COUNT_VALUE = "videoCount";
  static const ORDER_VIEW_COUNT_VALUE = "viewCount";
}
