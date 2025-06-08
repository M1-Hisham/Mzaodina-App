import 'package:json_annotation/json_annotation.dart';

part 'sayantaliq_auction_response.g.dart';

@JsonSerializable(explicitToJson: true)
class ReadyAuctionResponse {
  final bool status;
  final String message;
  final Data data;

  ReadyAuctionResponse({
    required this.status,
    required this.message,
    required this.data,
  });

  factory ReadyAuctionResponse.fromJson(Map<String, dynamic> json) =>
      _$ReadyAuctionResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ReadyAuctionResponseToJson(this);
}

@JsonSerializable()
class Data {
  final List<ReadyAuction> auctions;
  final int? total;
  @JsonKey(name: 'current_page')
  final int? currentPage;
  @JsonKey(name: 'last_page')
  final int? lastPage;
  @JsonKey(name: 'next_page_url')
  final String? nextPageUrl;
  @JsonKey(name: 'prev_page_url')
  final String? prevPageUrl;
  Data({
    required this.auctions,
    this.total,
    this.currentPage,
    this.lastPage,
    this.nextPageUrl,
    this.prevPageUrl,
  });
  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
  Map<String, dynamic> toJson() => _$DataToJson(this);
}

@JsonSerializable(explicitToJson: true)
class ReadyAuction {
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
  final bool? isRegister;
  @JsonKey(name: 'start_at')
  final String? startAt;
  final Product product;

  ReadyAuction({
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
    this.startAt,
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
