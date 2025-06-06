part of 'subscribe_auction_cubit.dart';

sealed class SubscribeToAuctionState {}

final class SubscribeAuctionInitial extends SubscribeToAuctionState {}

final class SubscribeAuctionLoading extends SubscribeToAuctionState {}

final class SubscribeAuctionSuccess extends SubscribeToAuctionState {
  final TapCheckoutUrlModel subscribeToAutionModel;

  SubscribeAuctionSuccess(this.subscribeToAutionModel);
}

final class SubscribeAuctionError extends SubscribeToAuctionState {
  final String message;

  SubscribeAuctionError(this.message);
}
