import 'package:json_annotation/json_annotation.dart';

part 'subscribe_aution_body.g.dart';

@JsonSerializable()
class SubscribeAutionBody {
  @JsonKey(name: 'registration_count')
  int registrationCount;
  @JsonKey(name: 'auction_id')
  int auctionId;
  @JsonKey(name: 'terms_conditions')
  bool termsConditions;
  SubscribeAutionBody({
    required this.registrationCount,
    required this.auctionId,
    required this.termsConditions,
  });
  factory SubscribeAutionBody.fromJson(Map<String, dynamic> json) =>
      _$SubscribeAutionBodyFromJson(json);

  Map<String, dynamic> toJson() => _$SubscribeAutionBodyToJson(this);
}
