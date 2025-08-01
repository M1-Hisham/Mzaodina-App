import 'package:json_annotation/json_annotation.dart';

part 'notstart_auction_response.g.dart';

@JsonSerializable()
class NotstartAuctionResponse {
  final bool status;
  final String message;
  final Data data;

  NotstartAuctionResponse({
    required this.status,
    required this.message,
    required this.data,
  });

  factory NotstartAuctionResponse.fromJson(Map<String, dynamic> json) =>
      _$NotstartAuctionResponseFromJson(json);
  Map<String, dynamic> toJson() => _$NotstartAuctionResponseToJson(this);
}

@JsonSerializable()
class Data {
  final List<NotstartAuction> auctions;
  final Meta? meta;
  Data({required this.auctions, this.meta});
  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
  Map<String, dynamic> toJson() => _$DataToJson(this);
}

@JsonSerializable()
class Meta {
  @JsonKey(name: 'current_page')
  final int currentPage;

  @JsonKey(name: 'last_page')
  final int lastPage;

  Meta({required this.currentPage, required this.lastPage});

  factory Meta.fromJson(Map<String, dynamic> json) => _$MetaFromJson(json);
  Map<String, dynamic> toJson() => _$MetaToJson(this);
}

@JsonSerializable()
class NotstartAuction {
  final int id;
  final String slug;
  final String status;

  @JsonKey(name: 'opening_amount')
  final int openingAmount;

  @JsonKey(name: 'required_bidders')
  final int? requiredBidders;

  @JsonKey(name: 'registration_amount')
  final int? registrationAmount;

  @JsonKey(name: 'auction_duration_minutes')
  final int? auctionDurationMinutes;

  @JsonKey(name: 'auction_start_rate')
  final double? auctionStartRate;

  @JsonKey(name: 'product_sku')
  final String? productSku;

  final String? type;

  final bool? isRegister;

  final Product product;

  NotstartAuction({
    required this.id,
    required this.slug,
    required this.status,
    required this.openingAmount,
    this.requiredBidders,
    this.registrationAmount,
    this.auctionDurationMinutes,
    this.auctionStartRate,
    this.productSku,
    this.isRegister,
    this.type,
    required this.product,
  });

  factory NotstartAuction.fromJson(Map<String, dynamic> json) =>
      _$NotstartAuctionFromJson(json);
  Map<String, dynamic> toJson() => _$NotstartAuctionToJson(this);
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
