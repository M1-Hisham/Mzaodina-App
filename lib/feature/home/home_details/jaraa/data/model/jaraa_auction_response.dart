import 'package:json_annotation/json_annotation.dart';

part 'jaraa_auction_response.g.dart';

@JsonSerializable(explicitToJson: true)
class JaraaAuctionResponse {
  final bool status;
  final String message;
  final List<JaraaAuction> data;

  JaraaAuctionResponse({
    required this.status,
    required this.message,
    required this.data,
  });

  factory JaraaAuctionResponse.fromJson(Map<String, dynamic> json) =>
      _$JaraaAuctionResponseFromJson(json);

  Map<String, dynamic> toJson() => _$JaraaAuctionResponseToJson(this);
}

@JsonSerializable(explicitToJson: true)
class JaraaAuction {
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

  JaraaAuction({
    required this.id,
    required this.slug,
    required this.status,
    required this.openingAmount,
    required this.canBidding,
    required this.endAt,
    required this.product,
    required this.maxBid,
  });

  factory JaraaAuction.fromJson(Map<String, dynamic> json) =>
      _$JaraaAuctionFromJson(json);

  Map<String, dynamic> toJson() => _$JaraaAuctionToJson(this);
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
