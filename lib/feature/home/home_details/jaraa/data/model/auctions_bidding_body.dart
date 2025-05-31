import 'package:json_annotation/json_annotation.dart';

part 'auctions_bidding_body.g.dart';

@JsonSerializable()
class AuctionsBiddingBody {
  final String slug;
  final int bid;

  AuctionsBiddingBody({
    required this.slug,
    required this.bid,
  });

  factory AuctionsBiddingBody.fromJson(Map<String, dynamic> json) =>
      _$AuctionsBiddingBodyFromJson(json);

  Map<String, dynamic> toJson() => _$AuctionsBiddingBodyToJson(this);
}
