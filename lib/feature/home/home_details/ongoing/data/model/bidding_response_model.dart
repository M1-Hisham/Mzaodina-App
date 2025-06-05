import 'package:json_annotation/json_annotation.dart';

part 'bidding_response_model.g.dart';

@JsonSerializable(explicitToJson: true)
class AuctionBiddingResponseModel {
  final bool status;
  final String message;
  final AuctionData data;

  AuctionBiddingResponseModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory AuctionBiddingResponseModel.fromJson(Map<String, dynamic> json) =>
      _$AuctionBiddingResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$AuctionBiddingResponseModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class AuctionData {
  final int id;
  final String slug;
  final String status;

  @JsonKey(name: 'opening_amount')
  final int openingAmount;

  final bool canBidding;

  @JsonKey(name: 'end_at')
  final String endAt;

  final Product product;

  @JsonKey(name: 'max_bid')
  final MaxBid maxBid;

  AuctionData({
    required this.id,
    required this.slug,
    required this.status,
    required this.openingAmount,
    required this.canBidding,
    required this.endAt,
    required this.product,
    required this.maxBid,
  });

  factory AuctionData.fromJson(Map<String, dynamic> json) =>
      _$AuctionDataFromJson(json);

  Map<String, dynamic> toJson() => _$AuctionDataToJson(this);
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

@JsonSerializable()
class MaxBid {
  final int id;
  final int bid;
  final User user;

  MaxBid({required this.id, required this.bid, required this.user});

  factory MaxBid.fromJson(Map<String, dynamic> json) => _$MaxBidFromJson(json);

  Map<String, dynamic> toJson() => _$MaxBidToJson(this);
}

@JsonSerializable()
class User {
  final int id;
  final String username;
  final String country;

  User({required this.id, required this.username, required this.country});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
