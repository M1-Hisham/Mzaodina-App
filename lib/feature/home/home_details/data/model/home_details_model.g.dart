// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_details_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeDetailsModel _$HomeDetailsModelFromJson(Map<String, dynamic> json) =>
    HomeDetailsModel(
      status: json['status'] as bool,
      message: json['message'] as String,
      data: UnifiedAuctionData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$HomeDetailsModelToJson(HomeDetailsModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data.toJson(),
    };

UnifiedAuctionData _$UnifiedAuctionDataFromJson(Map<String, dynamic> json) =>
    UnifiedAuctionData(
      auctions:
          (json['auctions'] as List<dynamic>)
              .map((e) => UnifiedAuction.fromJson(e as Map<String, dynamic>))
              .toList(),
      meta:
          json['meta'] == null
              ? null
              : UnifiedMeta.fromJson(json['meta'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UnifiedAuctionDataToJson(UnifiedAuctionData instance) =>
    <String, dynamic>{
      'auctions': instance.auctions.map((e) => e.toJson()).toList(),
      'meta': instance.meta?.toJson(),
    };

UnifiedMeta _$UnifiedMetaFromJson(Map<String, dynamic> json) => UnifiedMeta(
  currentPage: (json['current_page'] as num).toInt(),
  lastPage: (json['last_page'] as num).toInt(),
);

Map<String, dynamic> _$UnifiedMetaToJson(UnifiedMeta instance) =>
    <String, dynamic>{
      'current_page': instance.currentPage,
      'last_page': instance.lastPage,
    };

UnifiedAuction _$UnifiedAuctionFromJson(
  Map<String, dynamic> json,
) => UnifiedAuction(
  id: (json['id'] as num).toInt(),
  slug: json['slug'] as String,
  status: json['status'] as String,
  openingAmount: (json['opening_amount'] as num).toInt(),
  type: json['type'] as String?,
  isRegister: json['isRegister'] as bool?,
  startAt: json['start_at'] as String?,
  endAt: json['end_at'] as String?,
  requiredBidders: (json['required_bidders'] as num?)?.toInt(),
  registrationAmount: (json['registration_amount'] as num?)?.toInt(),
  auctionDurationMinutes: (json['auction_duration_minutes'] as num?)?.toInt(),
  auctionStartRate: (json['auction_start_rate'] as num?)?.toDouble(),
  productSku: json['product_sku'] as String?,
  canBidding: json['canBidding'] as bool?,
  product:
      json['product'] == null
          ? null
          : UnifiedProduct.fromJson(json['product'] as Map<String, dynamic>),
  maxBid:
      json['max_bid'] == null
          ? null
          : MaxBid.fromJson(json['max_bid'] as Map<String, dynamic>),
  winner:
      json['winner'] == null
          ? null
          : Winner.fromJson(json['winner'] as Map<String, dynamic>),
);

Map<String, dynamic> _$UnifiedAuctionToJson(UnifiedAuction instance) =>
    <String, dynamic>{
      'id': instance.id,
      'slug': instance.slug,
      'status': instance.status,
      'opening_amount': instance.openingAmount,
      'type': instance.type,
      'isRegister': instance.isRegister,
      'start_at': instance.startAt,
      'end_at': instance.endAt,
      'required_bidders': instance.requiredBidders,
      'registration_amount': instance.registrationAmount,
      'auction_duration_minutes': instance.auctionDurationMinutes,
      'auction_start_rate': instance.auctionStartRate,
      'product_sku': instance.productSku,
      'canBidding': instance.canBidding,
      'product': instance.product?.toJson(),
      'max_bid': instance.maxBid?.toJson(),
      'winner': instance.winner?.toJson(),
    };

UnifiedProduct _$UnifiedProductFromJson(Map<String, dynamic> json) =>
    UnifiedProduct(
      nameAr: json['name_ar'] as String,
      keywords: json['keywords'] as String,
      productDetails: json['product_details'] as String,
      price: json['price'] as String,
      weight: (json['weight'] as num).toInt(),
      images:
          (json['images'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$UnifiedProductToJson(UnifiedProduct instance) =>
    <String, dynamic>{
      'name_ar': instance.nameAr,
      'keywords': instance.keywords,
      'product_details': instance.productDetails,
      'price': instance.price,
      'weight': instance.weight,
      'images': instance.images,
    };

MaxBid _$MaxBidFromJson(Map<String, dynamic> json) => MaxBid(
  id: (json['id'] as num?)?.toInt(),
  bid: (json['bid'] as num).toInt(),
  user: User.fromJson(json['user'] as Map<String, dynamic>),
);

Map<String, dynamic> _$MaxBidToJson(MaxBid instance) => <String, dynamic>{
  'id': instance.id,
  'bid': instance.bid,
  'user': instance.user,
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

Winner _$WinnerFromJson(Map<String, dynamic> json) => Winner(
  id: (json['id'] as num?)?.toInt(),
  invoicePrice: json['invoice_price'] as String,
  user: WinnerUser.fromJson(json['user'] as Map<String, dynamic>),
);

Map<String, dynamic> _$WinnerToJson(Winner instance) => <String, dynamic>{
  'id': instance.id,
  'invoice_price': instance.invoicePrice,
  'user': instance.user,
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
