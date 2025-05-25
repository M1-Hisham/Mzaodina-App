// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'qadim_auction_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QadimAuctionResponse _$QadimAuctionResponseFromJson(
  Map<String, dynamic> json,
) => QadimAuctionResponse(
  status: json['status'] as bool,
  message: json['message'] as String,
  data:
      (json['data'] as List<dynamic>)
          .map((e) => QadimAuction.fromJson(e as Map<String, dynamic>))
          .toList(),
);

Map<String, dynamic> _$QadimAuctionResponseToJson(
  QadimAuctionResponse instance,
) => <String, dynamic>{
  'status': instance.status,
  'message': instance.message,
  'data': instance.data,
};

QadimAuction _$QadimAuctionFromJson(Map<String, dynamic> json) => QadimAuction(
  id: (json['id'] as num).toInt(),
  slug: json['slug'] as String,
  status: json['status'] as String,
  openingAmount: (json['opening_amount'] as num).toInt(),
  requiredBidders: (json['required_bidders'] as num).toInt(),
  registrationAmount: (json['registration_amount'] as num).toInt(),
  auctionDurationMinutes: (json['auction_duration_minutes'] as num?)?.toInt(),
  auctionStartRate: (json['auction_start_rate'] as num).toInt(),
  productSku: json['product_sku'] as String,
  isRegister: json['isRegister'] as bool,
  product: Product.fromJson(json['product'] as Map<String, dynamic>),
  type: json['type'] as String,
);

Map<String, dynamic> _$QadimAuctionToJson(QadimAuction instance) =>
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
      'type': instance.type,
      'isRegister': instance.isRegister,
      'product': instance.product,
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
