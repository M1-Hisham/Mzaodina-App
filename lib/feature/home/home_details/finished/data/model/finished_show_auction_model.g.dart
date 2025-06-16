// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'finished_show_auction_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FinishedShowAuctionModel _$FinishedShowAuctionModelFromJson(
  Map<String, dynamic> json,
) => FinishedShowAuctionModel(
  status: json['status'] as bool,
  message: json['message'] as String,
  data: AuctionData.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$FinishedShowAuctionModelToJson(
  FinishedShowAuctionModel instance,
) => <String, dynamic>{
  'status': instance.status,
  'message': instance.message,
  'data': instance.data.toJson(),
};

AuctionData _$AuctionDataFromJson(Map<String, dynamic> json) => AuctionData(
  id: (json['id'] as num).toInt(),
  slug: json['slug'] as String,
  status: json['status'] as String,
  openingAmount: (json['opening_amount'] as num).toInt(),
  product: Product.fromJson(json['product'] as Map<String, dynamic>),
  winner: Winner.fromJson(json['winner'] as Map<String, dynamic>),
);

Map<String, dynamic> _$AuctionDataToJson(AuctionData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'slug': instance.slug,
      'status': instance.status,
      'opening_amount': instance.openingAmount,
      'product': instance.product.toJson(),
      'winner': instance.winner.toJson(),
    };

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
  nameAr: json['name_ar'] as String,
  keywords: json['keywords'] as String,
  productDetails: json['product_details'] as String,
  price: json['price'] as String,
  weight: (json['weight'] as num).toInt(),
  images: (json['images'] as List<dynamic>).map((e) => e as String).toList(),
);

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
  'name_ar': instance.nameAr,
  'keywords': instance.keywords,
  'product_details': instance.productDetails,
  'price': instance.price,
  'weight': instance.weight,
  'images': instance.images,
};

Winner _$WinnerFromJson(Map<String, dynamic> json) => Winner(
  id: (json['id'] as num?)?.toInt(),
  invoicePrice: json['invoice_price'] as String,
  user: User.fromJson(json['user'] as Map<String, dynamic>),
);

Map<String, dynamic> _$WinnerToJson(Winner instance) => <String, dynamic>{
  'id': instance.id,
  'invoice_price': instance.invoicePrice,
  'user': instance.user.toJson(),
};

User _$UserFromJson(Map<String, dynamic> json) => User(
  id: (json['id'] as num?)?.toInt(),
  username: json['username'] as String,
  country: json['country'] as String,
);

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
  'id': instance.id,
  'username': instance.username,
  'country': instance.country,
};
