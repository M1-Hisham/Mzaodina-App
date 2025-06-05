import 'package:json_annotation/json_annotation.dart';

part 'sayantaliq_show_auction_mode.g.dart';

@JsonSerializable(explicitToJson: true)
class ReadyShowAuctionMode {
  final bool status;
  final String message;
  final ReadyAuction data;

  ReadyShowAuctionMode({
    required this.status,
    required this.message,
    required this.data,
  });

  factory ReadyShowAuctionMode.fromJson(Map<String, dynamic> json) =>
      _$ReadyShowAuctionModeFromJson(json);
  Map<String, dynamic> toJson() => _$ReadyShowAuctionModeToJson(this);
}

@JsonSerializable(explicitToJson: true)
class ReadyAuction {
  final int id;
  final String slug;
  final String status;
  @JsonKey(name: 'opening_amount')
  final int openingAmount;
  final String type;
  @JsonKey(name: 'required_bidders')
  final int requiredBidders;
  @JsonKey(name: 'current_bidders')
  final int currentBidders;
  final bool isRegister;
  @JsonKey(name: 'registration_amount')
  final int registrationAmount;
  @JsonKey(name: 'auction_duration_minutes')
  final int auctionDurationMinutes;
  @JsonKey(name: 'auction_start_rate')
  final int auctionStartRate;
  @JsonKey(name: 'product_sku')
  final String productSku;
  @JsonKey(name: 'start_at')
  final String startAt;
  final Product product;

  ReadyAuction({
    required this.id,
    required this.slug,
    required this.status,
    required this.openingAmount,
    required this.type,
    required this.requiredBidders,
    required this.currentBidders,
    required this.isRegister,
    required this.registrationAmount,
    required this.auctionDurationMinutes,
    required this.auctionStartRate,
    required this.productSku,
    required this.startAt,
    required this.product,
  });

  factory ReadyAuction.fromJson(Map<String, dynamic> json) =>
      _$ReadyAuctionFromJson(json);
  Map<String, dynamic> toJson() => _$ReadyAuctionToJson(this);
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
