import 'package:json_annotation/json_annotation.dart';

part 'qadim_auction_response.g.dart';

@JsonSerializable()
class QadimAuctionResponse {
  final bool status;
  final String message;
  final List<QadimAuction> data;

  QadimAuctionResponse({
    required this.status,
    required this.message,
    required this.data,
  });

  factory QadimAuctionResponse.fromJson(Map<String, dynamic> json) =>
      _$QadimAuctionResponseFromJson(json);
  Map<String, dynamic> toJson() => _$QadimAuctionResponseToJson(this);
}

@JsonSerializable()
class QadimAuction {
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
  final int? auctionDurationMinutes;

  @JsonKey(name: 'auction_start_rate')
  final int auctionStartRate;

  @JsonKey(name: 'product_sku')
  final String productSku;

  final String type;

  final bool isRegister;

  final Product product;

  QadimAuction({
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
    required this.product,
    required this.type,
  });

  factory QadimAuction.fromJson(Map<String, dynamic> json) =>
      _$QadimAuctionFromJson(json);
  Map<String, dynamic> toJson() => _$QadimAuctionToJson(this);
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
