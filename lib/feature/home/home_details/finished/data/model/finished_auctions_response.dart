import 'package:json_annotation/json_annotation.dart';

part 'finished_auctions_response.g.dart';

@JsonSerializable(explicitToJson: true)
class FinishedAuctionsResponse {
  final bool status;
  final String message;
  final Data data;

  FinishedAuctionsResponse({
    required this.status,
    required this.message,
    required this.data,
  });

  factory FinishedAuctionsResponse.fromJson(Map<String, dynamic> json) =>
      _$FinishedAuctionsResponseFromJson(json);
  Map<String, dynamic> toJson() => _$FinishedAuctionsResponseToJson(this);
}

@JsonSerializable()
class Data {
  final List<FinishedAction> auctions;
  final Meta? meta;

  Data({required this.auctions, this.meta});

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
  Map<String, dynamic> toJson() => _$DataToJson(this);

  Data copyWith({List<FinishedAction>? auctions, Meta? meta}) {
    return Data(auctions: auctions ?? this.auctions, meta: meta ?? this.meta);
  }
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

@JsonSerializable(explicitToJson: true)
class FinishedAction {
  final int id;
  final String slug;
  final String status;
  @JsonKey(name: 'opening_amount')
  final int openingAmount;
  final Product product;
  final Winner winner;

  FinishedAction({
    required this.id,
    required this.slug,
    required this.status,
    required this.openingAmount,
    required this.product,
    required this.winner,
  });

  factory FinishedAction.fromJson(Map<String, dynamic> json) =>
      _$FinishedActionFromJson(json);
  Map<String, dynamic> toJson() => _$FinishedActionToJson(this);
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
