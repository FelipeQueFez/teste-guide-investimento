// To parse this JSON data, do
//
//     final indexAssetModel = indexAssetModelFromJson(jsonString);

import 'dart:convert';

IndexAssetModel indexAssetModelFromJson(String str) =>
    IndexAssetModel.fromJson(json.decode(str));

String indexAssetModelToJson(IndexAssetModel data) =>
    json.encode(data.toJson());

class IndexAssetModel {
  IndexAssetModel({
    this.chart,
  });

  Chart? chart;

  IndexAssetModel copyWith({
    Chart? chart,
  }) =>
      IndexAssetModel(
        chart: chart ?? this.chart,
      );

  factory IndexAssetModel.fromJson(Map<String, dynamic> json) =>
      IndexAssetModel(
        chart: Chart.fromJson(json["chart"]),
      );

  Map<String, dynamic> toJson() => {
        "chart": chart?.toJson(),
      };
}

class Chart {
  Chart({
    this.result,
    this.error,
  });

  List<Result>? result;
  dynamic error;

  Chart copyWith({
    List<Result>? result,
    dynamic error,
  }) =>
      Chart(
        result: result ?? this.result,
        error: error ?? this.error,
      );

  factory Chart.fromJson(Map<String, dynamic> json) => Chart(
        result:
            List<Result>.from(json["result"].map((x) => Result.fromJson(x))),
        error: json["error"],
      );

  Map<String, dynamic> toJson() => {
        "result": result != null
            ? List<dynamic>.from(result!.map((x) => x.toJson()))
            : [],
        "error": error,
      };
}

class Result {
  Result({
    this.meta,
    this.timestamp,
    this.indicators,
  });

  Meta? meta;
  List<int>? timestamp;
  Indicators? indicators;

  Result copyWith({
    Meta? meta,
    List<int>? timestamp,
    Indicators? indicators,
  }) =>
      Result(
        meta: meta ?? this.meta,
        timestamp: timestamp ?? this.timestamp,
        indicators: indicators ?? this.indicators,
      );

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        meta: Meta.fromJson(json["meta"]),
        timestamp: List<int>.from(json["timestamp"].map((x) => x)),
        indicators: Indicators.fromJson(json["indicators"]),
      );

  Map<String, dynamic> toJson() => {
        "meta": meta?.toJson(),
        "timestamp": timestamp != null
            ? List<dynamic>.from(timestamp!.map((x) => x))
            : [],
        "indicators": indicators?.toJson(),
      };
}

class Indicators {
  Indicators({
    this.quote,
  });

  List<Quote>? quote;

  Indicators copyWith({
    List<Quote>? quote,
  }) =>
      Indicators(
        quote: quote ?? this.quote,
      );

  factory Indicators.fromJson(Map<String, dynamic> json) => Indicators(
        quote: List<Quote>.from(json["quote"].map((x) => Quote.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "quote": quote != null
            ? List<dynamic>.from(quote!.map((x) => x.toJson()))
            : [],
      };
}

class Quote {
  Quote({
    this.low,
    this.close,
    this.high,
    this.volume,
    this.open,
  });

  List<double?>? low;
  List<double?>? close;
  List<double?>? high;
  List<int?>? volume;
  List<double?>? open;

  Quote copyWith({
    List<double?>? low,
    List<double?>? close,
    List<double?>? high,
    List<int?>? volume,
    List<double?>? open,
  }) =>
      Quote(
        low: low ?? this.low,
        close: close ?? this.close,
        high: high ?? this.high,
        volume: volume ?? this.volume,
        open: open ?? this.open,
      );

  factory Quote.fromJson(Map<String, dynamic> json) => Quote(
        low: List<double>.from(json["low"].map((x) => x?.toDouble() ?? 0)),
        close: List<double>.from(json["close"].map((x) => x?.toDouble() ?? 0)),
        high: List<double>.from(json["high"].map((x) => x?.toDouble() ?? 0)),
        volume: List<int>.from(json["volume"].map((x) => x ?? 0)),
        open: List<double>.from(json["open"].map((x) => x?.toDouble() ?? 0)),
      );

  Map<String, dynamic> toJson() => {
        "low": low != null ? List<dynamic>.from(low!.map((x) => x)) : [],
        "close": close != null ? List<dynamic>.from(close!.map((x) => x)) : [],
        "high": high != null ? List<dynamic>.from(high!.map((x) => x)) : [],
        "volume":
            volume != null ? List<dynamic>.from(volume!.map((x) => x)) : [],
        "open": open != null ? List<dynamic>.from(open!.map((x) => x)) : [],
      };
}

class Meta {
  Meta({
    this.currency,
    this.symbol,
    this.exchangeName,
    this.instrumentType,
    this.firstTradeDate,
    this.regularMarketTime,
    this.gmtoffset,
    this.timezone,
    this.exchangeTimezoneName,
    this.regularMarketPrice,
    this.chartPreviousClose,
    this.previousClose,
    this.scale,
    this.priceHint,
    this.currentTradingPeriod,
    this.tradingPeriods,
    this.dataGranularity,
    this.range,
    this.validRanges,
  });

  String? currency;
  String? symbol;
  String? exchangeName;
  String? instrumentType;
  int? firstTradeDate;
  int? regularMarketTime;
  int? gmtoffset;
  String? timezone;
  String? exchangeTimezoneName;
  double? regularMarketPrice;
  double? chartPreviousClose;
  double? previousClose;
  int? scale;
  int? priceHint;
  CurrentTradingPeriod? currentTradingPeriod;
  List<List<Post>>? tradingPeriods;
  String? dataGranularity;
  String? range;
  List<String>? validRanges;

  Meta copyWith({
    String? currency,
    String? symbol,
    String? exchangeName,
    String? instrumentType,
    int? firstTradeDate,
    int? regularMarketTime,
    int? gmtoffset,
    String? timezone,
    String? exchangeTimezoneName,
    double? regularMarketPrice,
    double? chartPreviousClose,
    double? previousClose,
    int? scale,
    int? priceHint,
    CurrentTradingPeriod? currentTradingPeriod,
    List<List<Post>>? tradingPeriods,
    String? dataGranularity,
    String? range,
    List<String>? validRanges,
  }) =>
      Meta(
        currency: currency ?? this.currency,
        symbol: symbol ?? this.symbol,
        exchangeName: exchangeName ?? this.exchangeName,
        instrumentType: instrumentType ?? this.instrumentType,
        firstTradeDate: firstTradeDate ?? this.firstTradeDate,
        regularMarketTime: regularMarketTime ?? this.regularMarketTime,
        gmtoffset: gmtoffset ?? this.gmtoffset,
        timezone: timezone ?? this.timezone,
        exchangeTimezoneName: exchangeTimezoneName ?? this.exchangeTimezoneName,
        regularMarketPrice: regularMarketPrice ?? this.regularMarketPrice,
        chartPreviousClose: chartPreviousClose ?? this.chartPreviousClose,
        previousClose: previousClose ?? this.previousClose,
        scale: scale ?? this.scale,
        priceHint: priceHint ?? this.priceHint,
        currentTradingPeriod: currentTradingPeriod ?? this.currentTradingPeriod,
        tradingPeriods: tradingPeriods ?? this.tradingPeriods,
        dataGranularity: dataGranularity ?? this.dataGranularity,
        range: range ?? this.range,
        validRanges: validRanges ?? this.validRanges,
      );

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        currency: json["currency"],
        symbol: json["symbol"],
        exchangeName: json["exchangeName"],
        instrumentType: json["instrumentType"],
        firstTradeDate: json["firstTradeDate"],
        regularMarketTime: json["regularMarketTime"],
        gmtoffset: json["gmtoffset"],
        timezone: json["timezone"],
        exchangeTimezoneName: json["exchangeTimezoneName"],
        regularMarketPrice: json["regularMarketPrice"].toDouble(),
        chartPreviousClose: json["chartPreviousClose"].toDouble(),
        previousClose: json["previousClose"].toDouble(),
        scale: json["scale"],
        priceHint: json["priceHint"],
        currentTradingPeriod:
            CurrentTradingPeriod.fromJson(json["currentTradingPeriod"]),
        tradingPeriods: List<List<Post>>.from(json["tradingPeriods"]
            .map((x) => List<Post>.from(x.map((x) => Post.fromJson(x))))),
        dataGranularity: json["dataGranularity"],
        range: json["range"],
        validRanges: List<String>.from(json["validRanges"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "currency": currency,
        "symbol": symbol,
        "exchangeName": exchangeName,
        "instrumentType": instrumentType,
        "firstTradeDate": firstTradeDate,
        "regularMarketTime": regularMarketTime,
        "gmtoffset": gmtoffset,
        "timezone": timezone,
        "exchangeTimezoneName": exchangeTimezoneName,
        "regularMarketPrice": regularMarketPrice,
        "chartPreviousClose": chartPreviousClose,
        "previousClose": previousClose,
        "scale": scale,
        "priceHint": priceHint,
        "currentTradingPeriod": currentTradingPeriod?.toJson(),
        "tradingPeriods": tradingPeriods != null
            ? List<dynamic>.from(tradingPeriods!
                .map((x) => List<dynamic>.from(x.map((x) => x.toJson()))))
            : [],
        "dataGranularity": dataGranularity,
        "range": range,
        "validRanges": validRanges != null
            ? List<dynamic>.from(validRanges!.map((x) => x))
            : [],
      };
}

class CurrentTradingPeriod {
  CurrentTradingPeriod({
    this.pre,
    this.regular,
    this.post,
  });

  Post? pre;
  Post? regular;
  Post? post;

  CurrentTradingPeriod copyWith({
    Post? pre,
    Post? regular,
    Post? post,
  }) =>
      CurrentTradingPeriod(
        pre: pre ?? this.pre,
        regular: regular ?? this.regular,
        post: post ?? this.post,
      );

  factory CurrentTradingPeriod.fromJson(Map<String, dynamic> json) =>
      CurrentTradingPeriod(
        pre: Post.fromJson(json["pre"]),
        regular: Post.fromJson(json["regular"]),
        post: Post.fromJson(json["post"]),
      );

  Map<String, dynamic> toJson() => {
        "pre": pre?.toJson(),
        "regular": regular?.toJson(),
        "post": post?.toJson(),
      };
}

class Post {
  Post({
    this.timezone,
    this.end,
    this.start,
    this.gmtoffset,
  });

  String? timezone;
  int? end;
  int? start;
  int? gmtoffset;

  Post copyWith({
    String? timezone,
    int? end,
    int? start,
    int? gmtoffset,
  }) =>
      Post(
        timezone: timezone ?? this.timezone,
        end: end ?? this.end,
        start: start ?? this.start,
        gmtoffset: gmtoffset ?? this.gmtoffset,
      );

  factory Post.fromJson(Map<String, dynamic> json) => Post(
        timezone: json["timezone"],
        end: json["end"],
        start: json["start"],
        gmtoffset: json["gmtoffset"],
      );

  Map<String, dynamic> toJson() => {
        "timezone": timezone,
        "end": end,
        "start": start,
        "gmtoffset": gmtoffset,
      };
}
