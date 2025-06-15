import 'package:json_annotation/json_annotation.dart';

part 'finished_show_auction_model.g.dart';

@JsonSerializable(explicitToJson: true)
class FinishedShowAuctionModel {
  final bool status;
  final String message;
  final AuctionData data;

  FinishedShowAuctionModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory FinishedShowAuctionModel.fromJson(Map<String, dynamic> json) =>
      _$FinishedShowAuctionModelFromJson(json);
  Map<String, dynamic> toJson() => _$FinishedShowAuctionModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class AuctionData {
  final int id;
  final String slug;
  final String status;
  @JsonKey(name: 'opening_amount')
  final int openingAmount;
  final Product product;
  final Winner winner;

  AuctionData({
    required this.id,
    required this.slug,
    required this.status,
    required this.openingAmount,
    required this.product,
    required this.winner,
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

@JsonSerializable(explicitToJson: true)
class Winner {
  final int? id;
  @JsonKey(name: 'invoice_price')
  final String invoicePrice;
  final User user;

  Winner({required this.id, required this.invoicePrice, required this.user});

  factory Winner.fromJson(Map<String, dynamic> json) => _$WinnerFromJson(json);
  Map<String, dynamic> toJson() => _$WinnerToJson(this);
}

@JsonSerializable()
class User {
  final int? id;
  final String username;
  final String country;

  User({required this.id, required this.username, required this.country});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}
