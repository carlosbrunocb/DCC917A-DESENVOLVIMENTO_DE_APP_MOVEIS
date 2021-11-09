class CotacaoBitcoin {
  static const String AUD = "AUD";
  static const String BRL = "BRL";
  static const String CAD = "CAD";
  static const String CHF = "CHF";
  static const String CLP = "CLP";
  static const String CNY = "CNY";
  static const String CZK = "CZK";
  static const String DKK = "DKK";
  static const String EUR = "EUR";
  static const String GBP = "GBP";
  static const String HKD = "HKD";
  static const String INR = "INR";
  static const String ISK = "ISK";
  static const String JPY = "JPY";
  static const String KRW = "KRW";
  static const String NZD = "NZD";
  static const String PLN = "PLN";
  static const String RUB = "RUB";
  static const String SEK = "SEK";
  static const String SGD = "SGD";
  static const String THB = "THB";
  static const String TWD = "TWD";
  static const String USD = "USD";

  static const String LAST = "last";
  static const String BUY = "buy";
  static const String SELL = "sell";
  static const String SYMBOL = "symbol";

  double? _last;
  double? _buy;
  double? _sell;
  String? _symbol;

  CotacaoBitcoin({double? last,required buy, double?sell, String? symbol}){
    this._buy = buy;
    this._last = last!;
    this._sell = sell!;
    this._symbol = symbol!;
  }

  double get last => _last!;

  double get buy => _buy!;

  String get symbol => _symbol!;

  double get sell => _sell!;
}