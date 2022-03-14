class Market {
  String? exchangeId;
  String? symbol;
  String? baseAsset;
  String? quoteAsset;
  double? priceUnconverted;
  double? price;
  double? change24h;
  double? spread;
  double? volume24h;
  String? status;
  DateTime? createdAt;
  String? updatedAt;

  Market({
    this.exchangeId,
    this.symbol,
    this.baseAsset,
    this.quoteAsset,
    this.priceUnconverted,
    this.price,
    this.change24h,
    this.spread,
    this.volume24h,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  factory Market.fromJson(Map<String, dynamic> json) => Market(
        exchangeId: json['exchange_id'] as String?,
        symbol: json['symbol'] as String?,
        baseAsset: json['base_asset'] as String?,
        quoteAsset: json['quote_asset'] as String?,
        priceUnconverted: (json['price_unconverted'] as num?)?.toDouble(),
        price: (json['price'] as num?)?.toDouble(),
        change24h: (json['change_24h'] as num?)?.toDouble(),
        spread: (json['spread'] as num?)?.toDouble(),
        volume24h: (json['volume_24h'] as num?)?.toDouble(),
        status: json['status'] as String?,
        createdAt: json['created_at'] == null
            ? null
            : DateTime.parse(json['created_at'] as String),
        updatedAt: json['updated_at'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'exchange_id': exchangeId,
        'symbol': symbol,
        'base_asset': baseAsset,
        'quote_asset': quoteAsset,
        'price_unconverted': priceUnconverted,
        'price': price,
        'change_24h': change24h,
        'spread': spread,
        'volume_24h': volume24h,
        'status': status,
        'created_at': createdAt?.toIso8601String(),
        'updated_at': updatedAt,
      };
}
