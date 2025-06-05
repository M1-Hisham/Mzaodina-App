// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subscribe_aution_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubscribeAutionBody _$SubscribeAutionBodyFromJson(Map<String, dynamic> json) =>
    SubscribeAutionBody(
      registrationCount: (json['registration_count'] as num).toInt(),
      auctionId: (json['auction_id'] as num).toInt(),
      termsConditions: json['terms_conditions'] as bool,
    );

Map<String, dynamic> _$SubscribeAutionBodyToJson(
  SubscribeAutionBody instance,
) => <String, dynamic>{
  'registration_count': instance.registrationCount,
  'auction_id': instance.auctionId,
  'terms_conditions': instance.termsConditions,
};
