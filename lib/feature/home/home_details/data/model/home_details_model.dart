import 'package:json_annotation/json_annotation.dart';

part 'home_details_model.g.dart';

@JsonSerializable(explicitToJson: true)
class HomeDetailsModel {
  final bool status;
  final String message;
  final UnifiedAuctionData data;

  HomeDetailsModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory HomeDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$HomeDetailsModelFromJson(json);

  Map<String, dynamic> toJson() => _$HomeDetailsModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class UnifiedAuctionData {
  final List<UnifiedAuction> auctions;
  final UnifiedMeta? meta;

  UnifiedAuctionData({required this.auctions, this.meta});

  factory UnifiedAuctionData.fromJson(Map<String, dynamic> json) =>
      _$UnifiedAuctionDataFromJson(json);

  Map<String, dynamic> toJson() => _$UnifiedAuctionDataToJson(this);
}

@JsonSerializable()
class UnifiedMeta {
  @JsonKey(name: 'current_page')
  final int currentPage;
  @JsonKey(name: 'last_page')
  final int lastPage;

  UnifiedMeta({required this.currentPage, required this.lastPage});

  factory UnifiedMeta.fromJson(Map<String, dynamic> json) =>
      _$UnifiedMetaFromJson(json);

  Map<String, dynamic> toJson() => _$UnifiedMetaToJson(this);
}

@JsonSerializable(explicitToJson: true)
class UnifiedAuction {
  final int id;
  final String slug;
  final String status;

  @JsonKey(name: 'opening_amount')
  final int openingAmount;

  final String? type;
  final bool? isRegister;
  @JsonKey(name: 'start_at')
  final String? startAt;
  @JsonKey(name: 'end_at')
  final String? endAt;
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
  final bool? canBidding;

  final UnifiedProduct? product;
  @JsonKey(name: 'max_bid')
  final MaxBid? maxBid;
  final Winner? winner;

  UnifiedAuction({
    required this.id,
    required this.slug,
    required this.status,
    required this.openingAmount,
    this.type,
    this.isRegister,
    this.startAt,
    this.endAt,
    this.requiredBidders,
    this.registrationAmount,
    this.auctionDurationMinutes,
    this.auctionStartRate,
    this.productSku,
    this.canBidding,
    this.product,
    this.maxBid,
    this.winner,
  });

  factory UnifiedAuction.fromJson(Map<String, dynamic> json) =>
      _$UnifiedAuctionFromJson(json);

  Map<String, dynamic> toJson() => _$UnifiedAuctionToJson(this);
}

@JsonSerializable()
class UnifiedProduct {
  @JsonKey(name: 'name_ar')
  final String nameAr;
  final String keywords;
  @JsonKey(name: 'product_details')
  final String productDetails;
  final String price;
  final int weight;
  final List<String> images;

  UnifiedProduct({
    required this.nameAr,
    required this.keywords,
    required this.productDetails,
    required this.price,
    required this.weight,
    required this.images,
  });

  factory UnifiedProduct.fromJson(Map<String, dynamic> json) =>
      _$UnifiedProductFromJson(json);

  Map<String, dynamic> toJson() => _$UnifiedProductToJson(this);
}

@JsonSerializable()
class MaxBid {
  final int? id;
  final int bid;
  final User user;

  MaxBid({this.id, required this.bid, required this.user});

  factory MaxBid.fromJson(Map<String, dynamic> json) => _$MaxBidFromJson(json);

  Map<String, dynamic> toJson() => _$MaxBidToJson(this);
}

@JsonSerializable()
class User {
  final int? id;
  final String username;
  final String country;

  User({this.id, required this.username, required this.country});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}

@JsonSerializable()
class Winner {
  final int? id;
  @JsonKey(name: 'invoice_price')
  final String invoicePrice;
  final WinnerUser user;

  Winner({this.id, required this.invoicePrice, required this.user});

  factory Winner.fromJson(Map<String, dynamic> json) => _$WinnerFromJson(json);

  Map<String, dynamic> toJson() => _$WinnerToJson(this);
}

@JsonSerializable()
class WinnerUser {
  final int? id;
  final String username;
  final String country;

  WinnerUser({this.id, required this.username, required this.country});

  factory WinnerUser.fromJson(Map<String, dynamic> json) =>
      _$WinnerUserFromJson(json);

  Map<String, dynamic> toJson() => _$WinnerUserToJson(this);
}
