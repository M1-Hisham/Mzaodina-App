// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ready_show_auction_mode.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReadyShowAuctionMode _$ReadyShowAuctionModeFromJson(
  Map<String, dynamic> json,
) => ReadyShowAuctionMode(
  status: json['status'] as bool,
  message: json['message'] as String,
  data: ReadyAuction.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$ReadyShowAuctionModeToJson(
  ReadyShowAuctionMode instance,
) => <String, dynamic>{
  'status': instance.status,
  'message': instance.message,
  'data': instance.data.toJson(),
};

ReadyAuction _$ReadyAuctionFromJson(Map<String, dynamic> json) => ReadyAuction(
  id: (json['id'] as num).toInt(),
  slug: json['slug'] as String,
  status: json['status'] as String,
  openingAmount: (json['opening_amount'] as num).toInt(),
  type: json['type'] as String,
  requiredBidders: (json['required_bidders'] as num).toInt(),
  currentBidders: (json['current_bidders'] as num).toInt(),
  isRegister: json['isRegister'] as bool,
  registrationAmount: (json['registration_amount'] as num).toInt(),
  auctionDurationMinutes: (json['auction_duration_minutes'] as num).toInt(),
  auctionStartRate: (json['auction_start_rate'] as num).toDouble(),
  productSku: json['product_sku'] as String,
  startAt: json['start_at'] as String,
  product: Product.fromJson(json['product'] as Map<String, dynamic>),
);

Map<String, dynamic> _$ReadyAuctionToJson(ReadyAuction instance) =>
    <String, dynamic>{
      'id': instance.id,
      'slug': instance.slug,
      'status': instance.status,
      'opening_amount': instance.openingAmount,
      'type': instance.type,
      'required_bidders': instance.requiredBidders,
      'current_bidders': instance.currentBidders,
      'isRegister': instance.isRegister,
      'registration_amount': instance.registrationAmount,
      'auction_duration_minutes': instance.auctionDurationMinutes,
      'auction_start_rate': instance.auctionStartRate,
      'product_sku': instance.productSku,
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
