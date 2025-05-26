// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'muntahi_auctions_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MuntahiAuctionsResponse _$MuntahiAuctionsResponseFromJson(
  Map<String, dynamic> json,
) => MuntahiAuctionsResponse(
  status: json['status'] as bool,
  message: json['message'] as String,
  data:
      (json['data'] as List<dynamic>)
          .map((e) => MuntahiAction.fromJson(e as Map<String, dynamic>))
          .toList(),
);

Map<String, dynamic> _$MuntahiAuctionsResponseToJson(
  MuntahiAuctionsResponse instance,
) => <String, dynamic>{
  'status': instance.status,
  'message': instance.message,
  'data': instance.data.map((e) => e.toJson()).toList(),
};

MuntahiAction _$MuntahiActionFromJson(Map<String, dynamic> json) =>
    MuntahiAction(
      id: (json['id'] as num).toInt(),
      slug: json['slug'] as String,
      status: json['status'] as String,
      openingAmount: (json['opening_amount'] as num).toInt(),
      product: Product.fromJson(json['product'] as Map<String, dynamic>),
      winner: Winner.fromJson(json['winner'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MuntahiActionToJson(MuntahiAction instance) =>
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
  user: WinnerUser.fromJson(json['user'] as Map<String, dynamic>),
);

Map<String, dynamic> _$WinnerToJson(Winner instance) => <String, dynamic>{
  'id': instance.id,
  'invoice_price': instance.invoicePrice,
  'user': instance.user.toJson(),
};

WinnerUser _$WinnerUserFromJson(Map<String, dynamic> json) => WinnerUser(
  id: (json['id'] as num?)?.toInt(),
  username: json['username'] as String,
  country: json['country'] as String,
);

Map<String, dynamic> _$WinnerUserToJson(WinnerUser instance) =>
    <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'country': instance.country,
    };
