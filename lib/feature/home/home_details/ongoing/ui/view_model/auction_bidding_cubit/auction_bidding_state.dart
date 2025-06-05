part of 'auction_bidding_cubit.dart';

sealed class AuctionBiddingState {}

final class AuctionBiddingInitial extends AuctionBiddingState {}

final class AuctionBiddingLoading extends AuctionBiddingState {}

final class AuctionBiddingSuccess extends AuctionBiddingState {
  final AuctionBiddingResponseModel auctionBiddingResponseModel;

  AuctionBiddingSuccess(this.auctionBiddingResponseModel);
}

final class AuctionBiddingError extends AuctionBiddingState {
  final String message;

  AuctionBiddingError(this.message);
}
