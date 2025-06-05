import 'package:json_annotation/json_annotation.dart';

part 'jaraa_show_auction_model.g.dart';

@JsonSerializable(explicitToJson: true)
class OngoingShowAuctionModel {
  final bool status;
  final String message;
  final OngoingAuction data;

  OngoingShowAuctionModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory OngoingShowAuctionModel.fromJson(Map<String, dynamic> json) =>
      _$OngoingShowAuctionModelFromJson(json);
  Map<String, dynamic> toJson() => _$OngoingShowAuctionModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class OngoingAuction {
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

  OngoingAuction({
    required this.id,
    required this.slug,
    required this.status,
    required this.openingAmount,
    required this.canBidding,
    required this.endAt,
    required this.product,
    required this.maxBid,
  });

  factory OngoingAuction.fromJson(Map<String, dynamic> json) =>
      _$OngoingAuctionFromJson(json);
  Map<String, dynamic> toJson() => _$OngoingAuctionToJson(this);
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
  final int? id;
  final int? bid;
  final User? user;

  MaxBid({this.id, this.bid, this.user});

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
