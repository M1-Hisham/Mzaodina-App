// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auctions_bidding_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuctionsBiddingBody _$AuctionsBiddingBodyFromJson(Map<String, dynamic> json) =>
    AuctionsBiddingBody(
      slug: json['slug'] as String,
      bid: (json['bid'] as num).toInt(),
    );

Map<String, dynamic> _$AuctionsBiddingBodyToJson(
  AuctionsBiddingBody instance,
) => <String, dynamic>{'slug': instance.slug, 'bid': instance.bid};
