import 'market.dart';

class PaginationApimodel {
  List<Market>? markets;
  String? next;

  PaginationApimodel({this.markets, this.next});

  factory PaginationApimodel.fromJson(Map<String, dynamic> json) {
    return PaginationApimodel(
      markets: (json['markets'] as List<dynamic>?)
          ?.map((e) => Market.fromJson(e as Map<String, dynamic>))
          .toList(),
      next: json['next'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'markets': markets?.map((e) => e.toJson()).toList(),
        'next': next,
      };
}
