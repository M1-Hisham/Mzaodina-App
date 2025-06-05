// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sayantaliq_auction_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReadyAuctionResponse _$ReadyAuctionResponseFromJson(
  Map<String, dynamic> json,
) => ReadyAuctionResponse(
  status: json['status'] as bool,
  message: json['message'] as String,
  data: Data.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$ReadyAuctionResponseToJson(
  ReadyAuctionResponse instance,
) => <String, dynamic>{
  'status': instance.status,
  'message': instance.message,
  'data': instance.data.toJson(),
};

Data _$DataFromJson(Map<String, dynamic> json) => Data(
  auctions:
      (json['auctions'] as List<dynamic>)
          .map((e) => ReadyAuction.fromJson(e as Map<String, dynamic>))
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

ReadyAuction _$ReadyAuctionFromJson(Map<String, dynamic> json) => ReadyAuction(
  id: (json['id'] as num).toInt(),
  slug: json['slug'] as String,
  status: json['status'] as String,
  openingAmount: (json['opening_amount'] as num).toInt(),
  requiredBidders: (json['required_bidders'] as num?)?.toInt(),
  registrationAmount: (json['registration_amount'] as num?)?.toInt(),
  auctionDurationMinutes: (json['auction_duration_minutes'] as num?)?.toInt(),
  auctionStartRate: (json['auction_start_rate'] as num?)?.toInt(),
  productSku: json['product_sku'] as String?,
  isRegister: json['isRegister'] as bool?,
  startAt: json['start_at'] as String?,
  product: Product.fromJson(json['product'] as Map<String, dynamic>),
);

Map<String, dynamic> _$ReadyAuctionToJson(ReadyAuction instance) =>
    <String, dynamic>{
      'id': instance.id,
      'slug': instance.slug,
      'status': instance.status,
      'opening_amount': instance.openingAmount,
      'required_bidders': instance.requiredBidders,
      'registration_amount': instance.registrationAmount,
      'auction_duration_minutes': instance.auctionDurationMinutes,
      'auction_start_rate': instance.auctionStartRate,
      'product_sku': instance.productSku,
      'isRegister': instance.isRegister,
      'start_at': instance.startAt,
      'product': instance.product.toJson(),
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
