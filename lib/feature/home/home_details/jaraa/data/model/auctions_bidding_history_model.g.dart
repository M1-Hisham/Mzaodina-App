// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auctions_bidding_history_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuctionsBiddingHistoryModel _$AuctionsBiddingHistoryModelFromJson(
  Map<String, dynamic> json,
) => AuctionsBiddingHistoryModel(
  status: json['status'] as bool,
  message: json['message'] as String,
  data:
      (json['data'] as List<dynamic>)
          .map((e) => BiddingHistoryItem.fromJson(e as Map<String, dynamic>))
          .toList(),
);

Map<String, dynamic> _$AuctionsBiddingHistoryModelToJson(
  AuctionsBiddingHistoryModel instance,
) => <String, dynamic>{
  'status': instance.status,
  'message': instance.message,
  'data': instance.data,
};

BiddingHistoryItem _$BiddingHistoryItemFromJson(Map<String, dynamic> json) =>
    BiddingHistoryItem(
      user: BidUser.fromJson(json['user'] as Map<String, dynamic>),
      bid: (json['bid'] as num).toInt(),
      time: json['time'] as String,
      slug: json['slug'] as String,
    );

Map<String, dynamic> _$BiddingHistoryItemToJson(BiddingHistoryItem instance) =>
    <String, dynamic>{
      'user': instance.user,
      'bid': instance.bid,
      'time': instance.time,
      'slug': instance.slug,
    };

BidUser _$BidUserFromJson(Map<String, dynamic> json) => BidUser(
  id: (json['id'] as num?)?.toInt(),
  providerType: json['provider_type'] as String?,
  providerId: json['provider_id'] as String?,
  businessId: (json['business_id'] as num?)?.toInt(),
  name: json['name'] as String?,
  username: json['username'] as String,
  email: json['email'] as String,
  emailVerifiedAt: json['email_verified_at'] as String?,
  twoFactorConfirmedAt: json['two_factor_confirmed_at'] as String?,
  profilePhotoPath: json['profile_photo_path'] as String?,
  role: json['role'] as String,
  createdAt: json['created_at'] as String,
  updatedAt: json['updated_at'] as String,
  profilePhotoUrl: json['profile_photo_url'] as String,
);

Map<String, dynamic> _$BidUserToJson(BidUser instance) => <String, dynamic>{
  'id': instance.id,
  'provider_type': instance.providerType,
  'provider_id': instance.providerId,
  'business_id': instance.businessId,
  'name': instance.name,
  'username': instance.username,
  'email': instance.email,
  'email_verified_at': instance.emailVerifiedAt,
  'two_factor_confirmed_at': instance.twoFactorConfirmedAt,
  'profile_photo_path': instance.profilePhotoPath,
  'role': instance.role,
  'created_at': instance.createdAt,
  'updated_at': instance.updatedAt,
  'profile_photo_url': instance.profilePhotoUrl,
};
