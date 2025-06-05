// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'jaraa_auction_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OngoingAuctionResponse _$OngoingAuctionResponseFromJson(
  Map<String, dynamic> json,
) => OngoingAuctionResponse(
  status: json['status'] as bool,
  message: json['message'] as String,
  data: Data.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$OngoingAuctionResponseToJson(
  OngoingAuctionResponse instance,
) => <String, dynamic>{
  'status': instance.status,
  'message': instance.message,
  'data': instance.data.toJson(),
};

Data _$DataFromJson(Map<String, dynamic> json) => Data(
  auctions:
      (json['auctions'] as List<dynamic>)
          .map((e) => OngoingAuction.fromJson(e as Map<String, dynamic>))
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

OngoingAuction _$OngoingAuctionFromJson(Map<String, dynamic> json) =>
    OngoingAuction(
      id: (json['id'] as num).toInt(),
      slug: json['slug'] as String,
      status: json['status'] as String,
      openingAmount: (json['opening_amount'] as num).toInt(),
      canBidding: json['canBidding'] as bool,
      endAt: json['end_at'] as String,
      product: Product.fromJson(json['product'] as Map<String, dynamic>),
      maxBid: MaxBid.fromJson(json['max_bid'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$OngoingAuctionToJson(OngoingAuction instance) =>
    <String, dynamic>{
      'id': instance.id,
      'slug': instance.slug,
      'status': instance.status,
      'opening_amount': instance.openingAmount,
      'canBidding': instance.canBidding,
      'end_at': instance.endAt,
      'product': instance.product.toJson(),
      'max_bid': instance.maxBid.toJson(),
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
