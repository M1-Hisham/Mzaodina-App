part of 'subscribe_to_auction_cubit.dart';

sealed class SubscribeToAuctionState {}

final class SubscribeToAuctionInitial extends SubscribeToAuctionState {}

final class SubscribeToAuctionLoading extends SubscribeToAuctionState {}

final class SubscribeToAuctionSuccess extends SubscribeToAuctionState {
  final SubscribeToAutionModel subscribeToAutionModel;

  SubscribeToAuctionSuccess(this.subscribeToAutionModel);
}

final class SubscribeToAuctionError extends SubscribeToAuctionState {
  final String message;

  SubscribeToAuctionError(this.message);
}
