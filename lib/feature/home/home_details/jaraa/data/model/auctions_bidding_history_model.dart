import 'package:json_annotation/json_annotation.dart';

part 'auctions_bidding_history_model.g.dart';

@JsonSerializable()
class AuctionsBiddingHistoryModel {
  final bool status;
  final String message;
  final List<BiddingHistoryItem> data;

  AuctionsBiddingHistoryModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory AuctionsBiddingHistoryModel.fromJson(Map<String, dynamic> json) =>
      _$AuctionsBiddingHistoryModelFromJson(json);
  Map<String, dynamic> toJson() => _$AuctionsBiddingHistoryModelToJson(this);
}

@JsonSerializable()
class BiddingHistoryItem {
  final BidUser user;
  final int bid;
  final String time;
  final String slug;

  BiddingHistoryItem({
    required this.user,
    required this.bid,
    required this.time,
    required this.slug,
  });

  factory BiddingHistoryItem.fromJson(Map<String, dynamic> json) =>
      _$BiddingHistoryItemFromJson(json);
  Map<String, dynamic> toJson() => _$BiddingHistoryItemToJson(this);
}

@JsonSerializable()
class BidUser {
  final int? id;
  @JsonKey(name: 'provider_type')
  final String? providerType;
  @JsonKey(name: 'provider_id')
  final String? providerId;
  @JsonKey(name: 'business_id')
  final int? businessId;
  final String? name;
  final String username;
  final String email;
  @JsonKey(name: 'email_verified_at')
  final String? emailVerifiedAt;
  @JsonKey(name: 'two_factor_confirmed_at')
  final String? twoFactorConfirmedAt;
  @JsonKey(name: 'profile_photo_path')
  final String? profilePhotoPath;
  final String role;
  @JsonKey(name: 'created_at')
  final String createdAt;
  @JsonKey(name: 'updated_at')
  final String updatedAt;
  @JsonKey(name: 'profile_photo_url')
  final String profilePhotoUrl;

  BidUser({
    required this.id,
    required this.providerType,
    required this.providerId,
    required this.businessId,
    required this.name,
    required this.username,
    required this.email,
    required this.emailVerifiedAt,
    required this.twoFactorConfirmedAt,
    required this.profilePhotoPath,
    required this.role,
    required this.createdAt,
    required this.updatedAt,
    required this.profilePhotoUrl,
  });

  factory BidUser.fromJson(Map<String, dynamic> json) =>
      _$BidUserFromJson(json);
  Map<String, dynamic> toJson() => _$BidUserToJson(this);
}
