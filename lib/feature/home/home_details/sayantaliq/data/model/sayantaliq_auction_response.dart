import 'package:json_annotation/json_annotation.dart';

part 'sayantaliq_auction_response.g.dart';

@JsonSerializable(explicitToJson: true)
class SayantaliqAuctionResponse {
  final bool status;
  final String message;
  final List<SayantaliqAuction> data;

  SayantaliqAuctionResponse({
    required this.status,
    required this.message,
    required this.data,
  });

  factory SayantaliqAuctionResponse.fromJson(Map<String, dynamic> json) =>
      _$SayantaliqAuctionResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SayantaliqAuctionResponseToJson(this);
}

@JsonSerializable(explicitToJson: true)
class SayantaliqAuction {
  final int id;
  final String slug;
  final String status;
  @JsonKey(name: 'opening_amount')
  final int openingAmount;
  @JsonKey(name: 'required_bidders')
  final int requiredBidders;
  @JsonKey(name: 'registration_amount')
  final int registrationAmount;
  @JsonKey(name: 'auction_duration_minutes')
  final int auctionDurationMinutes;
  @JsonKey(name: 'auction_start_rate')
  final int auctionStartRate;
  @JsonKey(name: 'product_sku')
  final String productSku;
  final bool isRegister;
  @JsonKey(name: 'start_at')
  final String startAt;
  final Product product;

  SayantaliqAuction({
    required this.id,
    required this.slug,
    required this.status,
    required this.openingAmount,
    required this.requiredBidders,
    required this.registrationAmount,
    required this.auctionDurationMinutes,
    required this.auctionStartRate,
    required this.productSku,
    required this.isRegister,
    required this.startAt,
    required this.product,
  });

  factory SayantaliqAuction.fromJson(Map<String, dynamic> json) =>
      _$SayantaliqAuctionFromJson(json);

  Map<String, dynamic> toJson() => _$SayantaliqAuctionToJson(this);
}

@JsonSerializable()
class Product {
  @JsonKey(name: 'name_ar')
  final String nameAr;
  final String keywords;
  @JsonKey(name: 'product_details')
  final String productDetails;
  final String price;
  final int weight;
  final List<String> images;

  Product({
    required this.nameAr,
    required this.keywords,
    required this.productDetails,
    required this.price,
    required this.weight,
    required this.images,
  });

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);

  Map<String, dynamic> toJson() => _$ProductToJson(this);
}
