// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sayantaliq_auction_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SayantaliqAuctionResponse _$SayantaliqAuctionResponseFromJson(
  Map<String, dynamic> json,
) => SayantaliqAuctionResponse(
  status: json['status'] as bool,
  message: json['message'] as String,
  data:
      (json['data'] as List<dynamic>)
          .map((e) => SayantaliqAuction.fromJson(e as Map<String, dynamic>))
          .toList(),
);

Map<String, dynamic> _$SayantaliqAuctionResponseToJson(
  SayantaliqAuctionResponse instance,
) => <String, dynamic>{
  'status': instance.status,
  'message': instance.message,
  'data': instance.data.map((e) => e.toJson()).toList(),
};

SayantaliqAuction _$SayantaliqAuctionFromJson(Map<String, dynamic> json) =>
    SayantaliqAuction(
      id: (json['id'] as num).toInt(),
      slug: json['slug'] as String,
      status: json['status'] as String,
      openingAmount: (json['opening_amount'] as num).toInt(),
      requiredBidders: (json['required_bidders'] as num).toInt(),
      registrationAmount: (json['registration_amount'] as num).toInt(),
      auctionDurationMinutes: (json['auction_duration_minutes'] as num).toInt(),
      auctionStartRate: (json['auction_start_rate'] as num).toInt(),
      productSku: json['product_sku'] as String,
      isRegister: json['isRegister'] as bool,
      startAt: json['start_at'] as String,
      product: Product.fromJson(json['product'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SayantaliqAuctionToJson(SayantaliqAuction instance) =>
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
