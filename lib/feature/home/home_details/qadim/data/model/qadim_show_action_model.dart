import 'package:json_annotation/json_annotation.dart';

part 'qadim_show_action_model.g.dart';

@JsonSerializable()
class QadimShowAuctionModel {
  final bool status;
  final String message;
  final Auction data;

  QadimShowAuctionModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory QadimShowAuctionModel.fromJson(Map<String, dynamic> json) =>
      _$QadimShowAuctionModelFromJson(json);
  Map<String, dynamic> toJson() => _$QadimShowAuctionModelToJson(this);
}

@JsonSerializable()
class Auction {
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

  @JsonKey(name: 'isRegister')
  final bool isRegister;

  @JsonKey(name: 'registration_amount')
  final int registrationAmount;

  @JsonKey(name: 'auction_duration_minutes')
  final int? auctionDurationMinutes;

  @JsonKey(name: 'auction_start_rate')
  final int auctionStartRate;

  @JsonKey(name: 'product_sku')
  final String productSku;

  final Product product;

  Auction({
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
    required this.product,
  });

  factory Auction.fromJson(Map<String, dynamic> json) =>
      _$AuctionFromJson(json);
  Map<String, dynamic> toJson() => _$AuctionToJson(this);
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
