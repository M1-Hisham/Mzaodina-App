// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'muntahi_auctions_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FinishedAuctionsResponse _$FinishedAuctionsResponseFromJson(
  Map<String, dynamic> json,
) => FinishedAuctionsResponse(
  status: json['status'] as bool,
  message: json['message'] as String,
  data: Data.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$FinishedAuctionsResponseToJson(
  FinishedAuctionsResponse instance,
) => <String, dynamic>{
  'status': instance.status,
  'message': instance.message,
  'data': instance.data.toJson(),
};

Data _$DataFromJson(Map<String, dynamic> json) => Data(
  auctions:
      (json['auctions'] as List<dynamic>)
          .map((e) => FinishedAction.fromJson(e as Map<String, dynamic>))
          .toList(),
  total: (json['total'] as num?)?.toInt(),
  currentPage: (json['current_page'] as num?)?.toInt(),
  lastPage: (json['last_page'] as num?)?.toInt(),
  nextPageUrl: json['next_page_url'] as String?,
  prevPageUrl: json['prev_page_url'] as String?,
);

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
  'auctions': instance.auctions,
  'total': instance.total,
  'current_page': instance.currentPage,
  'last_page': instance.lastPage,
  'next_page_url': instance.nextPageUrl,
  'prev_page_url': instance.prevPageUrl,
};

FinishedAction _$FinishedActionFromJson(Map<String, dynamic> json) =>
    FinishedAction(
      id: (json['id'] as num).toInt(),
      slug: json['slug'] as String,
      status: json['status'] as String,
      openingAmount: (json['opening_amount'] as num).toInt(),
      product: Product.fromJson(json['product'] as Map<String, dynamic>),
      winner: Winner.fromJson(json['winner'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$FinishedActionToJson(FinishedAction instance) =>
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
